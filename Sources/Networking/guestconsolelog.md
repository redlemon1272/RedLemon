default	15:21:34.102904-0500	RedLemon	Connection 42: TLS Trust result 0
default	15:21:34.103332-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C42.1:2][0x7fa2065f25f0] Returning from external verify block with result: true
default	15:21:34.103439-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C42.1:2][0x7fa2065f25f0] Certificate verification result: OK
default	15:21:34.104079-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:34.104401-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:34.104443-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:34.104480-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:34.104517-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:34.104659-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS 1.3 client done
default	15:21:34.104967-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS client finish_client_handshake
default	15:21:34.105035-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fa2065f25f0] Client handshake state: TLS client done
default	15:21:34.105083-0500	RedLemon	boringssl_context_info_handler(2034) [C42.1:2][0x7fa2065f25f0] Client handshake done
default	15:21:34.105736-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C42.1:2][0x7fa2065f25f0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(162ms) flight_time(132ms) rtt(132ms) write_stalls(0) read_stalls(7)]
default	15:21:34.105937-0500	RedLemon	nw_flow_connected [C42.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:34.106426-0500	RedLemon	[C42.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.290s
default	15:21:34.106818-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state ready
default	15:21:34.106956-0500	RedLemon	[C42 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.291s
default	15:21:34.107126-0500	RedLemon	[C42.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.291s
default	15:21:34.107238-0500	RedLemon	[C42 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.291s
default	15:21:34.107628-0500	RedLemon	Connection 42: connected successfully
default	15:21:34.107687-0500	RedLemon	Connection 42: TLS handshake complete
default	15:21:34.108030-0500	RedLemon	Connection 42: ready C(N) E(N)
default	15:21:34.108275-0500	RedLemon	Task <48CFD7E3-DE48-49B2-BD69-7D32E528818B>.<1> now using Connection 42
default	15:21:34.108388-0500	RedLemon	Connection 42: received viability advisory(Y)
default	15:21:34.108628-0500	RedLemon	Task <48CFD7E3-DE48-49B2-BD69-7D32E528818B>.<1> sent request, body N 0
default	15:21:34.238656-0500	RedLemon	Task <48CFD7E3-DE48-49B2-BD69-7D32E528818B>.<1> received response, status 101 content U
default	15:21:34.239347-0500	RedLemon	Task <48CFD7E3-DE48-49B2-BD69-7D32E528818B>.<1> response ended
default	15:21:34.239521-0500	RedLemon	Task <48CFD7E3-DE48-49B2-BD69-7D32E528818B>.<1> done using Connection 42
default	15:21:34.240669-0500	RedLemon	[C42.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.424s
default	15:21:34.240761-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state preparing
default	15:21:34.240891-0500	RedLemon	[C42 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.425s
default	15:21:34.241240-0500	RedLemon	[C42.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.425s
default	15:21:34.241323-0500	RedLemon	[C42 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.425s
default	15:21:34.241429-0500	RedLemon	nw_flow_connected [C42.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:34.241764-0500	RedLemon	[C42.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.425s
default	15:21:34.241969-0500	RedLemon	[C42 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.426s
default	15:21:34.242594-0500	RedLemon	nw_flow_connected [C42.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:34.243392-0500	RedLemon	[C42.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.427s
default	15:21:34.243486-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state ready
default	15:21:34.243804-0500	RedLemon	[C42 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.428s
default	15:21:34.368889-0500	RedLemon	nw_flow_disconnected [C42.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:21:34.369436-0500	RedLemon	nw_protocol_tcp_log_summary [C42.1:3]
	[17A0B44B-845E-49FD-86E9-C0ED43B415B2 <private>:64918<-><private>:443]
	Init: 1, Conn_Time: 124.858ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 126.718ms, rtt_var: 4.125ms rtt_nc: 126.125ms, rtt_var_nc: 28.812ms base rtt: 124ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:34.369936-0500	RedLemon	tcp_input [C42.1:3] flags=[F.] seq=4269521479, ack=702460295, win=249 state=ESTABLISHED rcv_nxt=4269521479, snd_una=702460295
default	15:21:34.371140-0500	RedLemon	[C42.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.555s, error Socket is not connected
default	15:21:34.371243-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state failed error Socket is not connected
default	15:21:34.371378-0500	RedLemon	[C42 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.555s
error	15:21:34.371512-0500	RedLemon	nw_read_request_report [C42] Receive failed with error "Socket is not connected"
error	15:21:34.371603-0500	RedLemon	nw_flow_service_reads [C42.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	15:21:34.371685-0500	RedLemon	tcp_output [C42.1:3] flags=[R.] seq=702460426, ack=4269521480, win=2047 state=CLOSED rcv_nxt=4269521480, snd_una=702460295
error	15:21:34.371961-0500	RedLemon	Connection 42: received failure notification
default	15:21:34.372231-0500	RedLemon	Task <48CFD7E3-DE48-49B2-BD69-7D32E528818B>.<1> summary for task success {transaction_duration_ms=558, response_status=101, connection=42, protocol="http/1.1", domain_lookup_duration_ms=1, connect_duration_ms=288, secure_connection_duration_ms=162, private_relay=false, request_start_ms=294, request_duration_ms=0, response_start_ms=424, response_duration_ms=1, request_bytes=359, response_bytes=330, cache_hit=false}
error	15:21:34.372370-0500	RedLemon	nw_flow_add_write_request [C42.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
default	15:21:34.372406-0500	RedLemon	Task <48CFD7E3-DE48-49B2-BD69-7D32E528818B>.<1> finished successfully
error	15:21:34.372754-0500	RedLemon	nw_write_request_report [C42] Send failed with error "Socket is not connected"
default	15:21:34.372874-0500	RedLemon	Connection 42: cleaning up
default	15:21:34.372989-0500	RedLemon	[C42 082BBFA5-5D90-4BC3-8858-CE0DF85D7B65 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:21:34.373256-0500	RedLemon	[C42 082BBFA5-5D90-4BC3-8858-CE0DF85D7B65 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C42.1 C0DF9898-6011-4C5F-8642-BAC0938C07C5 10.0.0.249:64918<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.557s, DNS @0.000s took 0.001s, TCP @0.425s took 0.125s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:34.374033-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state cancelled error Socket is not connected
default	15:21:34.374259-0500	RedLemon	Connection 42: done
default	15:21:35.590434-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "frontmost:4026" ID:174-140-771 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	15:21:35.591056-0500	runningboardd	Assertion 174-140-771 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:35.609395-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:35.612637-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:35.626173-0500	runningboardd	[anon<RedLemon>(501):4026] Set darwin role to: UserInteractiveFocal
default	15:21:35.626348-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:35.633826-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "notification:4026" ID:174-140-772 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	15:21:35.633995-0500	runningboardd	Assertion 174-140-772 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:35.639163-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:35.639214-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:35.639260-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:36.781972-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:36.782771-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5027C05C-71B2-4260-9B1C-5BC58E894156] (reporting strategy default)> on Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> was not selected for reporting
default	15:21:36.783385-0500	RedLemon	Task <0009D71B-BC0B-4C21-A8B6-8817EC1C18E4>.<1> summary for task success {transaction_duration_ms=9189, response_status=101, connection=33, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=68, secure_connection_duration_ms=52, private_relay=false, request_start_ms=74, request_duration_ms=0, response_start_ms=219, response_duration_ms=0, request_bytes=828, response_bytes=850, cache_hit=false}
default	15:21:36.783391-0500	RedLemon	Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:36.784162-0500	RedLemon	Task <0009D71B-BC0B-4C21-A8B6-8817EC1C18E4>.<1> finished successfully
default	15:21:36.784220-0500	RedLemon	Connection 33: cleaning up
default	15:21:36.784497-0500	RedLemon	[C33 C5DAC026-CF73-482C-8E08-B20D8D94F0EC Hostname#2136ba9d:443 tcp, url hash: 450ba5fb, tls, definite, attribution: developer] cancel
default	15:21:36.784974-0500	RedLemon	[C33 C5DAC026-CF73-482C-8E08-B20D8D94F0EC Hostname#2136ba9d:443 tcp, url hash: 450ba5fb, tls, definite, attribution: developer] cancelled
	[C33.1 1820E5F2-8A57-40A4-AC7C-ED2902D48380 10.0.0.249:64917<->IPv4#b142724a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 9.189s, DNS @0.000s took 0.002s, TCP @0.219s took 0.014s, TLS 1.3 took 0.001s
	bytes in/out: 5122/1734, packets in/out: 10/13, rtt: 0.024s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:36.785382-0500	RedLemon	nw_flow_disconnected [C33.1 IPv4#b142724a:443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:21:36.785769-0500	RedLemon	nw_protocol_tcp_log_summary [C33.1:3]
	[35FD08BC-1BB3-4D5C-8FCB-70934FE89A1A <private>:64917<-><private>:443]
	Init: 1, Conn_Time: 14.537ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 24.218ms, rtt_var: 11.062ms rtt_nc: 20.281ms, rtt_var_nc: 13.812ms base rtt: 13ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:36.786804-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [275B5D43-C65F-489F-A6AE-3EE6968869D1] (reporting strategy default)> on Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> was not selected for reporting
default	15:21:36.786890-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state cancelled
default	15:21:36.787436-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:36.789081-0500	RedLemon	Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:36.793924-0500	RedLemon	Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> now using Connection 2
default	15:21:36.795732-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:36.796581-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5F3C0CB4-1869-4184-98A6-BF105595B3D3] (reporting strategy default)> on Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> was not selected for reporting
default	15:21:36.797348-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:36.798695-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A0C9F026-70B4-46FE-944E-51D47A572953] (reporting strategy default)> on Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> was not selected for reporting
default	15:21:36.800070-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:36.801647-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> now using Connection 41
default	15:21:36.802649-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:36.804374-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> now using Connection 41
default	15:21:36.815913-0500	RedLemon	tcp_output [C33.1:3] flags=[F.] seq=317154808, ack=3657806731, win=2048 state=FIN_WAIT_1 rcv_nxt=3657806731, snd_una=317154754
default	15:21:36.816261-0500	RedLemon	Connection 33: done
error	15:21:36.816487-0500	RedLemon	Read completed with an error <private>
default	15:21:36.816664-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> sent request, body N 0
default	15:21:36.816719-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> sent request, body N 0
default	15:21:36.816808-0500	RedLemon	tcp_input [C33.1:3] flags=[F.] seq=3657806731, ack=317154808, win=16 state=FIN_WAIT_1 rcv_nxt=3657806731, snd_una=317154808
default	15:21:36.816865-0500	RedLemon	tcp_output [C33.1:3] flags=[F.] seq=317154808, ack=3657806732, win=2048 state=CLOSING rcv_nxt=3657806732, snd_una=317154808
default	15:21:36.817713-0500	RedLemon	Connection 43: enabling TLS
default	15:21:36.817755-0500	RedLemon	Connection 43: starting, TC(0x0)
default	15:21:36.817848-0500	RedLemon	[C43 12B6CA8F-50C8-4F56-920C-0F6F26AE4B52 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{FCB9728E-7E86-4131-99D0-FBA53681FE44}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:36.817977-0500	RedLemon	[C43 Hostname#e4bebcad:443 initial path ((null))] event: path:start @0.000s
default	15:21:36.818644-0500	RedLemon	[C43 Hostname#e4bebcad:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 2BFC5FAF-A2F1-4C1E-B24E-214369658426
default	15:21:36.818923-0500	RedLemon	[C43 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	15:21:36.818969-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state preparing
default	15:21:36.819644-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> setting up Connection 43
default	15:21:36.820312-0500	mDNSResponder	[R952] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:36.821976-0500	RedLemon	0x7fa205ba00d8 ID=312 Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> sent request, body S 83
default	15:21:36.825351-0500	mDNSResponder	[R952] getaddrinfo stop -- hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, client pid: 4026 (RedLemon)
default	15:21:36.824913-0500	RedLemon	nw_endpoint_resolver_update [C43 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#21f40c4c:443
default	15:21:36.825793-0500	RedLemon	[C43 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.007s
default	15:21:36.826142-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 initial path ((null))] event: path:start @0.008s
default	15:21:36.826602-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.008s, uuid: 05A26C95-7519-41C8-B6EA-8A50D4618B11
default	15:21:36.826944-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.008s
default	15:21:36.827692-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.009s
default	15:21:36.828684-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.010s
default	15:21:36.828838-0500	RedLemon	tcp_output [C43.1:3] flags=[S] seq=899759488, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=899759488
default	15:21:36.837894-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> received response, status 200 content K
default	15:21:36.857794-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> done using Connection 41
default	15:21:36.858231-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> response ended
default	15:21:36.859297-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> summary for task success {transaction_duration_ms=62, response_status=200, connection=41, reused=1, request_start_ms=19, request_duration_ms=0, response_start_ms=40, response_duration_ms=20, request_bytes=41, response_bytes=118244, cache_hit=false}
default	15:21:36.859545-0500	RedLemon	Task <40BF267D-7346-49D5-AF69-8AE6BA170D96>.<120> finished successfully
default	15:21:36.860613-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> received response, status 200 content K
default	15:21:36.866497-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> done using Connection 41
default	15:21:36.866683-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> response ended
default	15:21:36.867568-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> summary for task success {transaction_duration_ms=68, response_status=200, connection=41, reused=1, request_start_ms=17, request_duration_ms=0, response_start_ms=61, response_duration_ms=6, request_bytes=36, response_bytes=63211, cache_hit=false}
default	15:21:36.867702-0500	RedLemon	Task <5CBEA140-A9B2-419F-9B06-192DF9BC94BB>.<121> finished successfully
default	15:21:36.893177-0500	RedLemon	0x7fa205ba00d8 ID=312 Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> received response, status 201 content U
default	15:21:36.893925-0500	RedLemon	Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> response ended
default	15:21:36.894294-0500	RedLemon	Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> done using Connection 2
default	15:21:36.894397-0500	RedLemon	Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> summary for task success {transaction_duration_ms=106, response_status=201, connection=2, reused=1, request_start_ms=6, request_duration_ms=27, response_start_ms=105, response_duration_ms=1, request_bytes=496, response_bytes=777, cache_hit=false}
default	15:21:36.894920-0500	RedLemon	Task <C5235009-9F7E-46EC-8C19-95AD4FED4B18>.<119> finished successfully
default	15:21:36.895178-0500	RedLemon	✅ Guest joined room 7KB4 in database
default	15:21:36.896104-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:36.896539-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E682885A-FDC5-43B0-BDD2-F7341AF7EE91] (reporting strategy default)> on Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> was not selected for reporting
default	15:21:36.897512-0500	RedLemon	Connection 44: enabling TLS
default	15:21:36.897552-0500	RedLemon	Connection 44: starting, TC(0x0)
default	15:21:36.897607-0500	RedLemon	[C44 DDE0BDC6-B124-4C1B-92A8-8242D8B5DB05 Hostname#2136ba9d:443 tcp, url hash: 450ba5fb, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{99B34D4C-DAD8-4EF2-9F39-42EF49393598}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:36.897696-0500	RedLemon	[C44 Hostname#2136ba9d:443 initial path ((null))] event: path:start @0.000s
default	15:21:36.898041-0500	RedLemon	[C44 Hostname#2136ba9d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: B7A1AC77-97BD-4677-A334-85149FCAE824
default	15:21:36.898303-0500	RedLemon	[C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:21:36.898406-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state preparing
default	15:21:36.898808-0500	mDNSResponder	[R953] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: '4awTpijcN9wOnZUl0kdtUw=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:36.898899-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> setting up Connection 44
default	15:21:36.902287-0500	RedLemon	nw_endpoint_resolver_update [C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#b142724a:443
default	15:21:36.902412-0500	RedLemon	nw_endpoint_resolver_update [C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#d1c97f43:443
default	15:21:36.902539-0500	RedLemon	[C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.004s
default	15:21:36.902750-0500	RedLemon	[C44.1 IPv4#b142724a:443 initial path ((null))] event: path:start @0.005s
default	15:21:36.903428-0500	RedLemon	[C44.1 IPv4#b142724a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: 37446861-BEDF-403E-90CC-542889EB13C1
default	15:21:36.903697-0500	RedLemon	[C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.006s
default	15:21:36.903059-0500	mDNSResponder	[R953] getaddrinfo stop -- hostname: <mask.hash: '4awTpijcN9wOnZUl0kdtUw=='>, client pid: 4026 (RedLemon)
default	15:21:36.904602-0500	RedLemon	[C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.006s
default	15:21:36.905488-0500	RedLemon	[C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.007s
default	15:21:36.905656-0500	RedLemon	tcp_output [C44.1:3] flags=[S] seq=3023750342, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3023750342
default	15:21:36.922969-0500	RedLemon	tcp_input [C44.1:3] flags=[S.] seq=2633575126, ack=3023750343, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3023750342
default	15:21:36.923115-0500	RedLemon	nw_flow_connected [C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:36.923280-0500	RedLemon	[C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.025s
default	15:21:36.923352-0500	RedLemon	[C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.025s
default	15:21:36.923789-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C44.1:2][0x7fa206e41800] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:36.924170-0500	RedLemon	boringssl_context_info_handler(2028) [C44.1:2][0x7fa206e41800] Client handshake started
default	15:21:36.924495-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS client enter_early_data
default	15:21:36.924865-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS client read_server_hello
default	15:21:36.947436-0500	RedLemon	tcp_input [C43.1:3] flags=[S.] seq=641413382, ack=899759489, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=899759488
default	15:21:36.947963-0500	RedLemon	nw_flow_connected [C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:36.948986-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.131s
default	15:21:36.949110-0500	RedLemon	[C43 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.131s
default	15:21:36.957724-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C43.1:2][0x7fa205ab60b0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:36.958609-0500	RedLemon	boringssl_context_info_handler(2028) [C43.1:2][0x7fa205ab60b0] Client handshake started
default	15:21:36.958827-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS client enter_early_data
default	15:21:36.958973-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS client read_server_hello
default	15:21:36.971040-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:36.971144-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:36.971539-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:36.971956-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:36.972037-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:36.972112-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:36.972511-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C44.1:2][0x7fa206e41800] Performing external trust evaluation
default	15:21:36.972702-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C44.1:2][0x7fa206e41800] Asyncing for external verify block
default	15:21:36.973061-0500	RedLemon	Connection 44: asked to evaluate TLS Trust
default	15:21:36.977103-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> auth completion disp=1 cred=0x0
default	15:21:36.987935-0500	RedLemon	Connection 44: TLS Trust result 0
default	15:21:36.988013-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C44.1:2][0x7fa206e41800] Returning from external verify block with result: true
default	15:21:36.988111-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C44.1:2][0x7fa206e41800] Certificate verification result: OK
default	15:21:36.988497-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:36.988594-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:36.988631-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:36.988672-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:36.988708-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:36.988845-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS 1.3 client done
default	15:21:36.989028-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS client finish_client_handshake
default	15:21:36.989077-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fa206e41800] Client handshake state: TLS client done
default	15:21:36.989115-0500	RedLemon	boringssl_context_info_handler(2034) [C44.1:2][0x7fa206e41800] Client handshake done
default	15:21:36.991944-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C44.1:2][0x7fa206e41800] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(67ms) flight_time(46ms) rtt(46ms) write_stalls(0) read_stalls(4)]
default	15:21:36.992659-0500	RedLemon	nw_flow_connected [C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:36.993197-0500	RedLemon	[C44.1 IPv4#b142724a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.095s
default	15:21:36.993556-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state ready
default	15:21:36.993653-0500	RedLemon	[C44 Hostname#2136ba9d:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.095s
default	15:21:36.993814-0500	RedLemon	[C44.1 IPv4#b142724a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.096s
default	15:21:36.993887-0500	RedLemon	[C44 Hostname#2136ba9d:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.096s
default	15:21:36.995124-0500	RedLemon	Connection 44: connected successfully
default	15:21:36.995199-0500	RedLemon	Connection 44: TLS handshake complete
default	15:21:36.995578-0500	RedLemon	Connection 44: ready C(N) E(N)
default	15:21:36.995894-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> now using Connection 44
default	15:21:36.996006-0500	RedLemon	Connection 44: received viability advisory(Y)
default	15:21:36.996481-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> sent request, body N 0
default	15:21:37.087793-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:37.088670-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:37.089529-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:37.093816-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:37.099477-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:37.099668-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:37.100565-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C43.1:2][0x7fa205ab60b0] Performing external trust evaluation
default	15:21:37.100740-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C43.1:2][0x7fa205ab60b0] Asyncing for external verify block
default	15:21:37.100965-0500	RedLemon	Connection 43: asked to evaluate TLS Trust
default	15:21:37.101378-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> auth completion disp=1 cred=0x0
default	15:21:37.119505-0500	RedLemon	Connection 43: TLS Trust result 0
default	15:21:37.119570-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C43.1:2][0x7fa205ab60b0] Returning from external verify block with result: true
default	15:21:37.119667-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C43.1:2][0x7fa205ab60b0] Certificate verification result: OK
default	15:21:37.120172-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:37.120747-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:37.120855-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:37.120913-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:37.120953-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:37.121253-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client done
default	15:21:37.121558-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS client finish_client_handshake
default	15:21:37.121613-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fa205ab60b0] Client handshake state: TLS client done
default	15:21:37.121660-0500	RedLemon	boringssl_context_info_handler(2034) [C43.1:2][0x7fa205ab60b0] Client handshake done
default	15:21:37.122442-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C43.1:2][0x7fa205ab60b0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(164ms) flight_time(134ms) rtt(129ms) write_stalls(0) read_stalls(7)]
default	15:21:37.122646-0500	RedLemon	nw_flow_connected [C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:37.125324-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.307s
default	15:21:37.127904-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state ready
default	15:21:37.127998-0500	RedLemon	[C43 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.310s
default	15:21:37.128199-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.310s
default	15:21:37.128283-0500	RedLemon	[C43 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.310s
default	15:21:37.129204-0500	RedLemon	Connection 43: connected successfully
default	15:21:37.129468-0500	RedLemon	Connection 43: TLS handshake complete
default	15:21:37.129910-0500	RedLemon	Connection 43: ready C(N) E(N)
default	15:21:37.130207-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> now using Connection 43
default	15:21:37.130347-0500	RedLemon	Connection 43: received viability advisory(Y)
default	15:21:37.130630-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> sent request, body N 0
default	15:21:37.160233-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> received response, status 101 content U
default	15:21:37.160649-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> response ended
default	15:21:37.161458-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> done using Connection 44
default	15:21:37.162250-0500	RedLemon	[C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.264s
default	15:21:37.162296-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state preparing
default	15:21:37.162364-0500	RedLemon	[C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.264s
default	15:21:37.162508-0500	RedLemon	[C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.264s
default	15:21:37.162569-0500	RedLemon	[C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.264s
default	15:21:37.162647-0500	RedLemon	nw_flow_connected [C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:37.162777-0500	RedLemon	[C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.265s
default	15:21:37.162837-0500	RedLemon	[C44 Hostname#2136ba9d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.265s
default	15:21:37.162971-0500	RedLemon	nw_flow_connected [C44.1 IPv4#b142724a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:37.163274-0500	RedLemon	[C44.1 IPv4#b142724a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.265s
default	15:21:37.163317-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state ready
default	15:21:37.163382-0500	RedLemon	[C44 Hostname#2136ba9d:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.265s
default	15:21:37.181359-0500	RedLemon	Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:37.182205-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F2E114CD-FCBC-4E28-B29C-1A5205F6519E] (reporting strategy default)> on Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> was not selected for reporting
default	15:21:37.185425-0500	RedLemon	Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:37.185758-0500	RedLemon	Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> now using Connection 2
default	15:21:37.187268-0500	RedLemon	0x7fa205bef3e8 ID=316 Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> sent request, body N 0
default	15:21:37.230844-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from ursinho in room 7KB4
default	15:21:37.231157-0500	RedLemon	👋 Received: Guest 'ursinho' joined room 7KB4
default	15:21:37.252443-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> received response, status 101 content U
default	15:21:37.252968-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> response ended
default	15:21:37.253026-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> done using Connection 43
default	15:21:37.253659-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.435s
default	15:21:37.253686-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state preparing
default	15:21:37.253854-0500	RedLemon	[C43 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.435s
default	15:21:37.254165-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.436s
default	15:21:37.254348-0500	RedLemon	[C43 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.436s
default	15:21:37.254434-0500	RedLemon	nw_flow_connected [C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:37.254699-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.436s
default	15:21:37.254786-0500	RedLemon	[C43 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.436s
default	15:21:37.255287-0500	RedLemon	nw_flow_connected [C43.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:37.255852-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.437s
default	15:21:37.255887-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state ready
default	15:21:37.255966-0500	RedLemon	[C43 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.438s
default	15:21:37.260986-0500	RedLemon	0x7fa205bef3e8 ID=316 Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> received response, status 200 content U
default	15:21:37.262048-0500	RedLemon	Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> response ended
default	15:21:37.264691-0500	RedLemon	Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> done using Connection 2
default	15:21:37.268317-0500	RedLemon	Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> summary for task success {transaction_duration_ms=83, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=75, response_duration_ms=6, request_bytes=511, response_bytes=831, cache_hit=false}
default	15:21:37.268898-0500	RedLemon	Task <BDF74777-3922-4E0B-8D9C-FEB77E3B0AF1>.<122> finished successfully
default	15:21:37.270369-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-775 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:37.270787-0500	runningboardd	Assertion 174-4026-775 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:37.271302-0500	RedLemon	Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:37.271770-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [ABF11341-7032-4EBD-8B78-A77F43F186A8] (reporting strategy default)> on Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> was not selected for reporting
default	15:21:37.272578-0500	RedLemon	Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:37.273257-0500	RedLemon	Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> now using Connection 2
default	15:21:37.278040-0500	RedLemon	0x7fa20289b2b8 ID=320 Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> sent request, body N 0
default	15:21:37.284054-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:37.284110-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:37.284162-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:37.297960-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-776 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:37.298497-0500	runningboardd	Assertion 174-114-776 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:37.301522-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:37.301575-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:37.301631-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:37.335124-0500	RedLemon	0x7fa20289b2b8 ID=320 Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> received response, status 200 content U
default	15:21:37.336616-0500	RedLemon	Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> response ended
default	15:21:37.337102-0500	RedLemon	Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> done using Connection 2
default	15:21:37.337301-0500	RedLemon	Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> summary for task success {transaction_duration_ms=65, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=4, response_start_ms=62, response_duration_ms=2, request_bytes=524, response_bytes=840, cache_hit=true}
default	15:21:37.337604-0500	RedLemon	Task <41369742-00D7-4C46-98FD-7B27D2DE8BCA>.<123> finished successfully
default	15:21:37.339358-0500	RedLemon	Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:37.339719-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2EABA744-25DB-45A7-A83A-FE966F3014DA] (reporting strategy default)> on Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> was not selected for reporting
default	15:21:37.342446-0500	RedLemon	Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:37.342828-0500	RedLemon	Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> now using Connection 2
default	15:21:37.344042-0500	RedLemon	0x7fa205bef3e8 ID=324 Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> sent request, body N 0
default	15:21:37.365165-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:21:37.382462-0500	RedLemon	nw_flow_disconnected [C43.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:21:37.382939-0500	RedLemon	nw_protocol_tcp_log_summary [C43.1:3]
	[1C5CD523-56E2-49C6-A709-55310D329042 <private>:64919<-><private>:443]
	Init: 1, Conn_Time: 118.743ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 125.187ms, rtt_var: 3.375ms rtt_nc: 121.031ms, rtt_var_nc: 27.937ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:37.385901-0500	RedLemon	[C43.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.567s, error Socket is not connected
default	15:21:37.385971-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state failed error Socket is not connected
default	15:21:37.386043-0500	RedLemon	[C43 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.568s
error	15:21:37.386112-0500	RedLemon	nw_read_request_report [C43] Receive failed with error "Socket is not connected"
error	15:21:37.386181-0500	RedLemon	nw_flow_service_reads [C43.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	15:21:37.386246-0500	RedLemon	tcp_output [C43.1:3] flags=[R.] seq=899760675, ack=641416413, win=2047 state=CLOSED rcv_nxt=641416413, snd_una=899760544
default	15:21:37.386440-0500	RedLemon	tcp_input [C43.1:3] flags=[F.] seq=641416413, ack=899760544, win=249 state=CLOSED rcv_nxt=641416413, snd_una=899760544
error	15:21:37.386575-0500	RedLemon	Connection 43: received failure notification
default	15:21:37.386899-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> summary for task success {transaction_duration_ms=603, response_status=101, connection=43, protocol="http/1.1", domain_lookup_duration_ms=6, connect_duration_ms=297, secure_connection_duration_ms=164, private_relay=false, request_start_ms=346, request_duration_ms=0, response_start_ms=468, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	15:21:37.386929-0500	RedLemon	nw_flow_add_write_request [C43.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
default	15:21:37.386992-0500	RedLemon	Task <9809400A-B172-4004-A38B-825A2FA48B9E>.<1> finished successfully
error	15:21:37.386984-0500	RedLemon	nw_write_request_report [C43] Send failed with error "Socket is not connected"
default	15:21:37.387078-0500	RedLemon	Connection 43: cleaning up
default	15:21:37.387146-0500	RedLemon	[C43 12B6CA8F-50C8-4F56-920C-0F6F26AE4B52 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:21:37.387327-0500	RedLemon	[C43 12B6CA8F-50C8-4F56-920C-0F6F26AE4B52 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C43.1 05A26C95-7519-41C8-B6EA-8A50D4618B11 10.0.0.249:64919<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.569s, DNS @0.001s took 0.006s, TCP @0.436s took 0.121s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:37.387840-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state cancelled error Socket is not connected
default	15:21:37.387918-0500	RedLemon	Connection 43: done
default	15:21:37.410262-0500	RedLemon	0x7fa205bef3e8 ID=324 Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> received response, status 200 content U
default	15:21:37.411364-0500	RedLemon	Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> response ended
default	15:21:37.412487-0500	RedLemon	Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> done using Connection 2
default	15:21:37.413145-0500	RedLemon	Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> summary for task success {transaction_duration_ms=71, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=68, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:21:37.413625-0500	RedLemon	Task <9E036B06-6F7D-4F0A-B00B-0C8A6AD47482>.<124> finished successfully
default	15:21:37.416462-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	15:21:37.416728-0500	RedLemon	👋 ursinho joined room
default	15:21:37.419344-0500	RedLemon	Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:37.421824-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D0A42671-B115-4994-8962-348EB32E19CE] (reporting strategy default)> on Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> was not selected for reporting
default	15:21:37.422872-0500	RedLemon	Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:37.425250-0500	RedLemon	Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> now using Connection 2
default	15:21:37.429995-0500	RedLemon	0x7fa20289b2b8 ID=328 Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> sent request, body N 0
default	15:21:37.495100-0500	RedLemon	0x7fa20289b2b8 ID=328 Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> received response, status 200 content U
default	15:21:37.495995-0500	RedLemon	Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> response ended
default	15:21:37.496690-0500	RedLemon	Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> done using Connection 2
default	15:21:37.497208-0500	RedLemon	Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> summary for task success {transaction_duration_ms=74, response_status=200, connection=2, reused=1, request_start_ms=2, request_duration_ms=4, response_start_ms=72, response_duration_ms=2, request_bytes=500, response_bytes=969, cache_hit=false}
default	15:21:37.498006-0500	RedLemon	Task <6EBB73CD-5D84-4B25-A50A-8EC9D6B99C43>.<125> finished successfully
default	15:21:38.239149-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:38.239831-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [24B4397C-DF66-43DD-AFB6-7C037AD6C4A7] (reporting strategy default)> on Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> was not selected for reporting
default	15:21:38.245292-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:38.246829-0500	RedLemon	Connection 45: enabling TLS
default	15:21:38.246896-0500	RedLemon	Connection 45: starting, TC(0x0)
default	15:21:38.246968-0500	RedLemon	[C45 11DE77B8-8BF2-4039-9631-1165C37BB5FB Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{1EE4A0EA-1565-484B-B3F6-3C4D06E8F6A6}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:38.247083-0500	RedLemon	[C45 Hostname#e4bebcad:443 initial path ((null))] event: path:start @0.000s
default	15:21:38.247515-0500	RedLemon	[C45 Hostname#e4bebcad:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 8441F2B3-1A11-4105-860A-9D000A159692
default	15:21:38.252285-0500	mDNSResponder	[R954] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:38.247946-0500	RedLemon	[C45 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:21:38.250957-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state preparing
default	15:21:38.251260-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> setting up Connection 45
default	15:21:38.254369-0500	mDNSResponder	[R954] getaddrinfo stop -- hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, client pid: 4026 (RedLemon)
default	15:21:38.254436-0500	RedLemon	nw_endpoint_resolver_update [C45 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#21f40c4c:443
default	15:21:38.254575-0500	RedLemon	[C45 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.007s
default	15:21:38.254869-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 initial path ((null))] event: path:start @0.007s
default	15:21:38.255361-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.008s, uuid: B54E262B-334C-4B70-8BC4-962D60A91B5F
default	15:21:38.255513-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.008s
default	15:21:38.256057-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.008s
default	15:21:38.260044-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.013s
default	15:21:38.260207-0500	RedLemon	tcp_output [C45.1:3] flags=[S] seq=2335390443, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2335390443
default	15:21:38.350294-0500	runningboardd	Invalidating assertion 174-4026-775 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:38.383229-0500	RedLemon	tcp_input [C45.1:3] flags=[S.] seq=1825555303, ack=2335390444, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2335390443
default	15:21:38.384677-0500	RedLemon	nw_flow_connected [C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:38.384857-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.137s
default	15:21:38.384927-0500	RedLemon	[C45 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.137s
default	15:21:38.385334-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C45.1:2][0x7fa205ab60b0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:38.385459-0500	RedLemon	boringssl_context_info_handler(2028) [C45.1:2][0x7fa205ab60b0] Client handshake started
default	15:21:38.385684-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS client enter_early_data
default	15:21:38.385860-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS client read_server_hello
default	15:21:38.439302-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:38.439759-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4CD9531E-726B-4B09-A2A0-D5E6E7D5D4FE] (reporting strategy default)> on Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> was not selected for reporting
default	15:21:38.442153-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:38.444680-0500	RedLemon	Connection 46: enabling TLS
default	15:21:38.445036-0500	RedLemon	Connection 46: starting, TC(0x0)
default	15:21:38.445404-0500	RedLemon	[C46 D2B93DB3-C33F-426E-BBE7-BE4B71DB013B Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{6CDCED2C-7AD8-41BF-BFB6-4F3A4F5AF03D}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:38.447298-0500	RedLemon	[C46 Hostname#e4bebcad:443 initial path ((null))] event: path:start @0.000s
default	15:21:38.447777-0500	RedLemon	[C46 Hostname#e4bebcad:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 1FC7A825-A0C0-4932-A7E2-3893A831BB3D
default	15:21:38.449860-0500	RedLemon	[C46 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.002s
default	15:21:38.449928-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state preparing
default	15:21:38.450370-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> setting up Connection 46
default	15:21:38.450560-0500	mDNSResponder	[R955] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:38.453613-0500	RedLemon	nw_endpoint_resolver_update [C46 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#21f40c4c:443
default	15:21:38.453685-0500	mDNSResponder	[R955] getaddrinfo stop -- hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, client pid: 4026 (RedLemon)
default	15:21:38.453989-0500	RedLemon	[C46 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.006s
default	15:21:38.454423-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 initial path ((null))] event: path:start @0.007s
default	15:21:38.454926-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.007s, uuid: D19AB73D-4FD4-417E-AE16-DFA673B27BC2
default	15:21:38.455087-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.007s
default	15:21:38.455768-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.008s
default	15:21:38.458945-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.011s
default	15:21:38.463386-0500	RedLemon	tcp_output [C46.1:3] flags=[S] seq=2002785629, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2002785629
default	15:21:38.469990-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:38.470213-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:38.470274-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:38.472400-0500	runningboardd	Invalidating assertion 174-114-776 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:38.519006-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:38.519128-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:38.519517-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:38.520024-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:38.520344-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:38.520417-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:38.521027-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C45.1:2][0x7fa205ab60b0] Performing external trust evaluation
default	15:21:38.521187-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C45.1:2][0x7fa205ab60b0] Asyncing for external verify block
default	15:21:38.521475-0500	RedLemon	Connection 45: asked to evaluate TLS Trust
default	15:21:38.521739-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> auth completion disp=1 cred=0x0
default	15:21:38.533138-0500	RedLemon	Connection 45: TLS Trust result 0
default	15:21:38.533210-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C45.1:2][0x7fa205ab60b0] Returning from external verify block with result: true
default	15:21:38.533304-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C45.1:2][0x7fa205ab60b0] Certificate verification result: OK
default	15:21:38.533802-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:38.534104-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:38.534146-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:38.534184-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:38.534223-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:38.534360-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS 1.3 client done
default	15:21:38.534583-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS client finish_client_handshake
default	15:21:38.534703-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fa205ab60b0] Client handshake state: TLS client done
default	15:21:38.534997-0500	RedLemon	boringssl_context_info_handler(2034) [C45.1:2][0x7fa205ab60b0] Client handshake done
default	15:21:38.535851-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C45.1:2][0x7fa205ab60b0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(150ms) flight_time(133ms) rtt(133ms) write_stalls(0) read_stalls(6)]
default	15:21:38.536114-0500	RedLemon	nw_flow_connected [C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:38.536550-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.289s
default	15:21:38.536906-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state ready
default	15:21:38.536977-0500	RedLemon	[C45 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.289s
default	15:21:38.537125-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.290s
default	15:21:38.537198-0500	RedLemon	[C45 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.290s
default	15:21:38.537513-0500	RedLemon	Connection 45: connected successfully
default	15:21:38.537569-0500	RedLemon	Connection 45: TLS handshake complete
default	15:21:38.537806-0500	RedLemon	Connection 45: ready C(N) E(N)
default	15:21:38.537992-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> now using Connection 45
default	15:21:38.538084-0500	RedLemon	Connection 45: received viability advisory(Y)
default	15:21:38.538275-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> sent request, body N 0
default	15:21:38.587163-0500	RedLemon	tcp_input [C46.1:3] flags=[S.] seq=3764271069, ack=2002785630, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2002785629
default	15:21:38.587306-0500	RedLemon	nw_flow_connected [C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:38.587467-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.140s
default	15:21:38.587534-0500	RedLemon	[C46 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.140s
default	15:21:38.587918-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C46.1:2][0x7fa205a9bc90] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:38.588047-0500	RedLemon	boringssl_context_info_handler(2028) [C46.1:2][0x7fa205a9bc90] Client handshake started
default	15:21:38.588252-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS client enter_early_data
default	15:21:38.588395-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS client read_server_hello
default	15:21:38.637399-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room 7KB4
default	15:21:38.637619-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	15:21:38.661812-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:38.662313-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:38.662765-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:38.669265-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> received response, status 101 content U
default	15:21:38.669523-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> response ended
default	15:21:38.669579-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> done using Connection 45
default	15:21:38.669817-0500	RedLemon	Connection 21: cleaning up
default	15:21:38.669897-0500	RedLemon	[C21 0B089519-33FD-4AD7-BAB5-F5D51F25BDEB 127.0.0.1:47253 tcp, url hash: 8f4f1011, definite, attribution: developer] cancel
default	15:21:38.670728-0500	RedLemon	[C21 0B089519-33FD-4AD7-BAB5-F5D51F25BDEB 127.0.0.1:47253 tcp, url hash: 8f4f1011, definite, attribution: developer] cancelled
	[C21 D21592DE-4F27-4972-BD50-76F74281122A 127.0.0.1:49626<->127.0.0.1:47253]
	Connected Path: satisfied (Path is satisfied), viable, interface: lo0
	Privacy Stance: Not Eligible
	Duration: 58.547s, TCP @0.002s took 0.000s
	bytes in/out: 643/744, packets in/out: 3/4, rtt: 0.001s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:38.671267-0500	RedLemon	nw_flow_disconnected [C21 127.0.0.1:47253 cancelled socket-flow ((null))] Output protocol disconnected
default	15:21:38.671319-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C21] reporting state cancelled
default	15:21:38.672276-0500	RedLemon	Connection 15: cleaning up
default	15:21:38.672425-0500	RedLemon	[C15 F5D00E40-532B-4518-B741-92FF609B7F6D Hostname#b1ba13f1:443 quic-connection, url hash: 492fc1a4, definite, attribution: developer] cancel
default	15:21:38.672619-0500	RedLemon	[C15 F5D00E40-532B-4518-B741-92FF609B7F6D Hostname#b1ba13f1:443 quic-connection, url hash: 492fc1a4, definite, attribution: developer] cancelled
	[C15.1.1 430C8A93-6BD2-42E1-9DE8-B9BE5B19D2CE 2607:fea8:995b:fd00:e143:eb11:f54f:69d1.60034<->IPv6#09e42a48.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 60.171s, DNS @0.001s took 0.006s, TCP @0.013s took 0.016s, TLS 1.2 took 0.122s
	bytes in/out: 4738/884, packets in/out: 7/10, rtt: 0.017s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:38.673907-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	15:21:38.679744-0500	RedLemon	Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:38.681346-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3CBBF1F7-5E56-47EB-AFDC-9A443EE3E764] (reporting strategy default)> on Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> was not selected for reporting
default	15:21:38.681441-0500	RedLemon	nw_protocol_tcp_log_summary [C15.1.1:3]
	[CCD11CF9-5EA0-4EB6-8D93-492BE79F22BC <private>:60034<-><private>:443]
	Init: 1, Conn_Time: 15.886ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 17.093ms, rtt_var: 7.750ms rtt_nc: 18.531ms, rtt_var_nc: 7.687ms base rtt: 16ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:38.682216-0500	RedLemon	nw_flow_disconnected [C15.1.1 IPv6#09e42a48.443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:21:38.683547-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C15] reporting state cancelled
default	15:21:38.684838-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.436s
default	15:21:38.687134-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state preparing
default	15:21:38.687381-0500	RedLemon	[C45 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.440s
default	15:21:38.687818-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.440s
default	15:21:38.688005-0500	RedLemon	[C45 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.440s
default	15:21:38.688138-0500	RedLemon	nw_flow_connected [C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:38.688287-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.441s
default	15:21:38.688359-0500	RedLemon	[C45 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.441s
default	15:21:38.688555-0500	RedLemon	nw_flow_connected [C45.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:38.688946-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.441s
default	15:21:38.689016-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state ready
default	15:21:38.689089-0500	RedLemon	[C45 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.442s
default	15:21:38.692152-0500	RedLemon	Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:38.693252-0500	RedLemon	Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> now using Connection 2
default	15:21:38.694654-0500	RedLemon	Connection 21: done
default	15:21:38.695836-0500	RedLemon	Connection 15: done
default	15:21:38.695898-0500	RedLemon	tcp_output [C15.1.1:3] flags=[F.] seq=3149173540, ack=768789418, win=2048 state=FIN_WAIT_1 rcv_nxt=768789418, snd_una=3149173509
default	15:21:38.696404-0500	RedLemon	0x7fa205df59d8 ID=332 Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> sent request, body N 0
default	15:21:38.703207-0500	RedLemon	tcp_input [C15.1.1:3] flags=[F.] seq=768789418, ack=3149173540, win=16 state=FIN_WAIT_1 rcv_nxt=768789418, snd_una=3149173509
default	15:21:38.703342-0500	RedLemon	tcp_output [C15.1.1:3] flags=[F.] seq=3149173540, ack=768789419, win=2048 state=CLOSING rcv_nxt=768789419, snd_una=3149173540
default	15:21:38.719356-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:38.719711-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:38.720190-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:38.720666-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:38.721959-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:38.722032-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:38.723746-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C46.1:2][0x7fa205a9bc90] Performing external trust evaluation
default	15:21:38.724265-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C46.1:2][0x7fa205a9bc90] Asyncing for external verify block
default	15:21:38.724570-0500	RedLemon	Connection 46: asked to evaluate TLS Trust
default	15:21:38.726315-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> auth completion disp=1 cred=0x0
default	15:21:38.738634-0500	RedLemon	Connection 46: TLS Trust result 0
default	15:21:38.738720-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C46.1:2][0x7fa205a9bc90] Returning from external verify block with result: true
default	15:21:38.738832-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C46.1:2][0x7fa205a9bc90] Certificate verification result: OK
default	15:21:38.739801-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:38.740871-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:38.740968-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:38.741571-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:38.741770-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:38.742259-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS 1.3 client done
default	15:21:38.742602-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS client finish_client_handshake
default	15:21:38.742656-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fa205a9bc90] Client handshake state: TLS client done
default	15:21:38.742697-0500	RedLemon	boringssl_context_info_handler(2034) [C46.1:2][0x7fa205a9bc90] Client handshake done
default	15:21:38.743427-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C46.1:2][0x7fa205a9bc90] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(155ms) flight_time(132ms) rtt(131ms) write_stalls(0) read_stalls(7)]
default	15:21:38.743617-0500	RedLemon	nw_flow_connected [C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:38.743895-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.296s
default	15:21:38.744162-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state ready
default	15:21:38.744226-0500	RedLemon	[C46 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.296s
default	15:21:38.744359-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.297s
default	15:21:38.744425-0500	RedLemon	[C46 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.297s
default	15:21:38.744755-0500	RedLemon	Connection 46: connected successfully
default	15:21:38.744806-0500	RedLemon	Connection 46: TLS handshake complete
default	15:21:38.745083-0500	RedLemon	Connection 46: ready C(N) E(N)
default	15:21:38.745357-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> now using Connection 46
default	15:21:38.745476-0500	RedLemon	Connection 46: received viability advisory(Y)
default	15:21:38.745943-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> sent request, body N 0
default	15:21:38.763616-0500	RedLemon	0x7fa205df59d8 ID=332 Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> received response, status 200 content U
default	15:21:38.764213-0500	RedLemon	Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> response ended
default	15:21:38.764780-0500	RedLemon	Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> done using Connection 2
default	15:21:38.765033-0500	RedLemon	Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> summary for task success {transaction_duration_ms=82, response_status=200, connection=2, reused=1, request_start_ms=10, request_duration_ms=3, response_start_ms=80, response_duration_ms=1, request_bytes=500, response_bytes=957, cache_hit=false}
default	15:21:38.765687-0500	RedLemon	Task <6155CB3E-D690-474F-9BF4-EB776CE2B2A4>.<126> finished successfully
default	15:21:38.769457-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	15:21:38.769785-0500	RedLemon	🎬 Guest: Fetch took 0.093s, waiting 3.157s (includes 0.25s sync buffer)
default	15:21:38.770263-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-777 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:38.770498-0500	runningboardd	Assertion 174-4026-777 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:38.771431-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:38.771488-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:38.771538-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:38.779351-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-778 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:38.780452-0500	runningboardd	Assertion 174-114-778 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:38.788431-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:38.788496-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:38.788547-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:38.812427-0500	RedLemon	nw_flow_disconnected [C45.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:21:38.812733-0500	RedLemon	nw_protocol_tcp_log_summary [C45.1:3]
	[E1E6089C-A246-45AB-A04B-B6564D391E9E <private>:64921<-><private>:443]
	Init: 1, Conn_Time: 124.449ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 125.906ms, rtt_var: 3.625ms rtt_nc: 124.125ms, rtt_var_nc: 27.875ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:38.813427-0500	RedLemon	[C45.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.566s, error Socket is not connected
default	15:21:38.813513-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state failed error Socket is not connected
default	15:21:38.813581-0500	RedLemon	[C45 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.566s
default	15:21:38.813644-0500	RedLemon	tcp_output [C45.1:3] flags=[F.] seq=2335391643, ack=1825558311, win=2048 state=FIN_WAIT_1 rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.813724-0500	RedLemon	Connection 45: received failure notification
default	15:21:38.813849-0500	RedLemon	tcp_input [C45.1:3] flags=[F.] seq=1825558335, ack=2335391512, win=249 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.814208-0500	RedLemon	nw_read_request_report [C45] Receive failed with error "Socket is not connected"
error	15:21:38.814455-0500	RedLemon	nw_flow_service_reads [C45.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	15:21:38.814640-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> summary for task success {transaction_duration_ms=570, response_status=101, connection=45, protocol="http/1.1", domain_lookup_duration_ms=7, connect_duration_ms=276, secure_connection_duration_ms=150, private_relay=false, request_start_ms=294, request_duration_ms=0, response_start_ms=425, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	15:21:38.814708-0500	RedLemon	Task <996C1A6C-1455-49E1-9C79-275CC1080947>.<1> finished successfully
error	15:21:38.817131-0500	RedLemon	nw_flow_add_write_request [C45.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:21:38.819612-0500	RedLemon	nw_write_request_report [C45] Send failed with error "Socket is not connected"
default	15:21:38.819710-0500	RedLemon	Connection 45: cleaning up
default	15:21:38.819871-0500	RedLemon	[C45 11DE77B8-8BF2-4039-9631-1165C37BB5FB Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:21:38.820092-0500	RedLemon	[C45 11DE77B8-8BF2-4039-9631-1165C37BB5FB Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C45.1 B54E262B-334C-4B70-8BC4-962D60A91B5F 10.0.0.249:64921<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.572s, DNS @0.000s took 0.007s, TCP @0.440s took 0.124s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:38.820533-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state cancelled error Socket is not connected
default	15:21:38.820662-0500	RedLemon	Connection 45: done
default	15:21:38.869396-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> received response, status 101 content U
default	15:21:38.869733-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> response ended
default	15:21:38.869836-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> done using Connection 46
default	15:21:38.870424-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.423s
default	15:21:38.870454-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state preparing
default	15:21:38.870493-0500	RedLemon	[C46 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.423s
default	15:21:38.870609-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.423s
default	15:21:38.870690-0500	RedLemon	[C46 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.423s
default	15:21:38.870841-0500	RedLemon	nw_flow_connected [C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:38.871074-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.423s
default	15:21:38.871138-0500	RedLemon	[C46 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.423s
default	15:21:38.871263-0500	RedLemon	nw_flow_connected [C46.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:38.871613-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.424s
default	15:21:38.871658-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state ready
default	15:21:38.871721-0500	RedLemon	[C46 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.424s
error	15:21:38.939130-0500	RedLemon	tcp_input [C45.1:3] flags=[R] seq=1825558311, ack=0, win=0 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.943212-0500	RedLemon	tcp_input [C45.1:3] flags=[R] seq=1825558311, ack=0, win=0 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.943339-0500	RedLemon	tcp_input [C45.1:3] flags=[R] seq=1825558311, ack=0, win=0 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.943553-0500	RedLemon	tcp_input [C45.1:3] flags=[R] seq=1825558311, ack=0, win=0 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.943624-0500	RedLemon	tcp_input [C45.1:3] flags=[R] seq=1825558311, ack=0, win=0 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.943685-0500	RedLemon	tcp_input [C45.1:3] flags=[R] seq=1825558311, ack=0, win=0 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
error	15:21:38.943744-0500	RedLemon	tcp_input [C45.1:3] flags=[R] seq=1825558311, ack=0, win=0 state=CLOSED rcv_nxt=1825558311, snd_una=2335391512
default	15:21:38.998043-0500	RedLemon	nw_flow_disconnected [C46.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:21:38.998647-0500	RedLemon	nw_protocol_tcp_log_summary [C46.1:3]
	[BA900D56-31E5-49CC-A201-4F58795F5C66 <private>:64922<-><private>:443]
	Init: 1, Conn_Time: 123.915ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 125.937ms, rtt_var: 2.437ms rtt_nc: 124.750ms, rtt_var_nc: 27.187ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:39.001050-0500	RedLemon	tcp_input [C46.1:3] flags=[FP.] seq=3764274077, ack=2002786686, win=249 state=ESTABLISHED rcv_nxt=3764274077, snd_una=2002786686
default	15:21:39.001975-0500	RedLemon	[C46.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.554s, error Socket is not connected
default	15:21:39.002031-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state failed error Socket is not connected
default	15:21:39.002099-0500	RedLemon	[C46 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.554s
error	15:21:39.002167-0500	RedLemon	nw_read_request_report [C46] Receive failed with error "Socket is not connected"
error	15:21:39.002257-0500	RedLemon	nw_flow_service_reads [C46.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	15:21:39.002355-0500	RedLemon	tcp_output [C46.1:3] flags=[R.] seq=2002786817, ack=3764274102, win=2047 state=CLOSED rcv_nxt=3764274102, snd_una=2002786686
error	15:21:39.002584-0500	RedLemon	Connection 46: received failure notification
default	15:21:39.002788-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> summary for task success {transaction_duration_ms=562, response_status=101, connection=46, protocol="http/1.1", domain_lookup_duration_ms=4, connect_duration_ms=285, secure_connection_duration_ms=155, private_relay=false, request_start_ms=304, request_duration_ms=0, response_start_ms=428, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	15:21:39.002923-0500	RedLemon	Task <696EEDC4-0F47-4779-8B0C-C3FF6065C4FB>.<1> finished successfully
error	15:21:39.002805-0500	RedLemon	nw_flow_add_write_request [C46.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
default	15:21:39.003361-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
error	15:21:39.003510-0500	RedLemon	nw_write_request_report [C46] Send failed with error "Socket is not connected"
default	15:21:39.003628-0500	RedLemon	Connection 46: cleaning up
default	15:21:39.003696-0500	RedLemon	[C46 D2B93DB3-C33F-426E-BBE7-BE4B71DB013B Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:21:39.003818-0500	RedLemon	[C46 D2B93DB3-C33F-426E-BBE7-BE4B71DB013B Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C46.1 D19AB73D-4FD4-417E-AE16-DFA673B27BC2 10.0.0.249:64922<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.556s, DNS @0.002s took 0.004s, TCP @0.423s took 0.129s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:39.004475-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state cancelled error Socket is not connected
default	15:21:39.004731-0500	RedLemon	Connection 46: done
default	15:21:39.348680-0500	RedLemon	Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:39.349217-0500	RedLemon	Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:39.350219-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7256A49C-0C12-45A5-BB2C-D587C8D36DF5] (reporting strategy default)> on Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> was not selected for reporting
default	15:21:39.352005-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2E4F3A04-E6AF-4A71-A14E-B782ABDC491A] (reporting strategy default)> on Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> was not selected for reporting
default	15:21:39.352502-0500	RedLemon	Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:39.352901-0500	RedLemon	Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> now using Connection 2
default	15:21:39.354427-0500	RedLemon	Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:39.354734-0500	RedLemon	Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> now using Connection 2
default	15:21:39.355925-0500	RedLemon	0x7fa202afe5a8 ID=336 Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> sent request, body N 0
default	15:21:39.355973-0500	RedLemon	0x7fa205b7af08 ID=340 Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> sent request, body N 0
default	15:21:39.417817-0500	RedLemon	0x7fa202afe5a8 ID=336 Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> received response, status 200 content U
default	15:21:39.418857-0500	RedLemon	Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> response ended
default	15:21:39.419388-0500	RedLemon	Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> done using Connection 2
default	15:21:39.419615-0500	RedLemon	Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> summary for task success {transaction_duration_ms=67, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=3, response_start_ms=64, response_duration_ms=2, request_bytes=500, response_bytes=956, cache_hit=true}
default	15:21:39.419886-0500	RedLemon	Task <0706D71A-0BAE-49AC-BF60-38D7D86F174E>.<127> finished successfully
default	15:21:39.421971-0500	RedLemon	🎬 Guest: Detected room playback start via database fallback
default	15:21:39.468447-0500	RedLemon	0x7fa205b7af08 ID=340 Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> received response, status 200 content U
default	15:21:39.469314-0500	RedLemon	Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> response ended
default	15:21:39.469835-0500	RedLemon	Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> done using Connection 2
default	15:21:39.470017-0500	RedLemon	Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> summary for task success {transaction_duration_ms=117, response_status=200, connection=2, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=115, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=true}
default	15:21:39.470474-0500	RedLemon	Task <7EAD1FD2-C27F-4FF5-83A7-D3A84569DC03>.<128> finished successfully
default	15:21:39.472382-0500	RedLemon	Task <10700122-E155-464A-B25A-2FA53544C775>.<129> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:39.472878-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B612F499-DD03-4D00-9EB6-F719C9B0A7E4] (reporting strategy default)> on Task <10700122-E155-464A-B25A-2FA53544C775>.<129> was not selected for reporting
default	15:21:39.474253-0500	RedLemon	Task <10700122-E155-464A-B25A-2FA53544C775>.<129> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:39.474915-0500	RedLemon	Task <10700122-E155-464A-B25A-2FA53544C775>.<129> now using Connection 2
default	15:21:39.477446-0500	RedLemon	0x7fa205b66ac8 ID=344 Task <10700122-E155-464A-B25A-2FA53544C775>.<129> sent request, body N 0
default	15:21:39.536072-0500	RedLemon	0x7fa205b66ac8 ID=344 Task <10700122-E155-464A-B25A-2FA53544C775>.<129> received response, status 200 content U
default	15:21:39.536700-0500	RedLemon	Task <10700122-E155-464A-B25A-2FA53544C775>.<129> response ended
default	15:21:39.537067-0500	RedLemon	Task <10700122-E155-464A-B25A-2FA53544C775>.<129> done using Connection 2
default	15:21:39.537225-0500	RedLemon	Task <10700122-E155-464A-B25A-2FA53544C775>.<129> summary for task success {transaction_duration_ms=63, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	15:21:39.537662-0500	RedLemon	Task <10700122-E155-464A-B25A-2FA53544C775>.<129> finished successfully
default	15:21:39.539402-0500	RedLemon	Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:39.540254-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [40F1754E-4D37-489E-9182-C124838E75FC] (reporting strategy default)> on Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> was not selected for reporting
default	15:21:39.541497-0500	RedLemon	Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:39.542207-0500	RedLemon	Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> now using Connection 2
default	15:21:39.543324-0500	RedLemon	0x7fa205b66ac8 ID=348 Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> sent request, body N 0
default	15:21:39.602135-0500	RedLemon	0x7fa205b66ac8 ID=348 Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> received response, status 200 content U
default	15:21:39.602863-0500	RedLemon	Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> response ended
default	15:21:39.603291-0500	RedLemon	Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> done using Connection 2
default	15:21:39.603472-0500	RedLemon	Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> summary for task success {transaction_duration_ms=62, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:21:39.603790-0500	RedLemon	Task <D2230942-2ECA-4AF1-AB79-A55DBF48DE6B>.<130> finished successfully
default	15:21:39.605575-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	15:21:39.642580-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:21:39.854243-0500	runningboardd	Invalidating assertion 174-4026-777 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:39.968425-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:39.968499-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:39.968559-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:39.970426-0500	runningboardd	Invalidating assertion 174-114-778 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:40.147413-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:40.147488-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:40.147695-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:40.468993-0500	RedLemon	CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transaction isn't created on a main thread.
default	15:21:40.470525-0500	RedLemon	CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transaction isn't created on a main thread.
default	15:21:40.665029-0500	runningboardd	Assertion did invalidate due to timeout: 174-140-772 (target:[anon<RedLemon>(501):4026])
default	15:21:40.772372-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:40.772418-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:40.772473-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:41.150506-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:41.151365-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A0BFDC46-FB38-44A7-8F18-944FA1BCD00C] (reporting strategy default)> on Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> was not selected for reporting
default	15:21:41.152482-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:41.154784-0500	RedLemon	Connection 47: enabling TLS
default	15:21:41.154827-0500	RedLemon	Connection 47: starting, TC(0x0)
default	15:21:41.154938-0500	RedLemon	[C47 E6FAA9B0-8ABA-449E-B938-476C31C3AFB2 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{A40F2377-FF39-4602-86D8-5A85809994E6}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:41.155100-0500	RedLemon	[C47 Hostname#e4bebcad:443 initial path ((null))] event: path:start @0.000s
default	15:21:41.155591-0500	RedLemon	[C47 Hostname#e4bebcad:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 042FAFDB-B21E-4F1D-9994-8742DCC14B53
default	15:21:41.155833-0500	RedLemon	[C47 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:21:41.155883-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state preparing
default	15:21:41.156086-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> setting up Connection 47
default	15:21:41.156369-0500	mDNSResponder	[R956] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:41.161133-0500	RedLemon	nw_endpoint_resolver_update [C47 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#21f40c4c:443
default	15:21:41.161320-0500	RedLemon	[C47 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.006s
default	15:21:41.162019-0500	mDNSResponder	[R956] getaddrinfo stop -- hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, client pid: 4026 (RedLemon)
default	15:21:41.163089-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 initial path ((null))] event: path:start @0.008s
default	15:21:41.163826-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.008s, uuid: 9BA32C7C-6972-4B26-947C-6B2D4D538309
default	15:21:41.163990-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.008s
default	15:21:41.165518-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.010s
default	15:21:41.166995-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.011s
default	15:21:41.167155-0500	RedLemon	tcp_output [C47.1:3] flags=[S] seq=3291736652, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3291736652
default	15:21:41.287839-0500	RedLemon	tcp_input [C47.1:3] flags=[S.] seq=3236000305, ack=3291736653, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=3291736652
default	15:21:41.287974-0500	RedLemon	nw_flow_connected [C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:41.288072-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	15:21:41.288111-0500	RedLemon	[C47 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	15:21:41.288371-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C47.1:2][0x7fa205ef46a0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:41.288463-0500	RedLemon	boringssl_context_info_handler(2028) [C47.1:2][0x7fa205ef46a0] Client handshake started
default	15:21:41.288574-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS client enter_early_data
default	15:21:41.288753-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS client read_server_hello
default	15:21:41.421506-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:41.421559-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:41.421741-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:41.422409-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:41.423027-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:41.423115-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:41.424362-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C47.1:2][0x7fa205ef46a0] Performing external trust evaluation
default	15:21:41.424520-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C47.1:2][0x7fa205ef46a0] Asyncing for external verify block
default	15:21:41.424778-0500	RedLemon	Connection 47: asked to evaluate TLS Trust
default	15:21:41.425442-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> auth completion disp=1 cred=0x0
default	15:21:41.433686-0500	RedLemon	Connection 47: TLS Trust result 0
default	15:21:41.433752-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C47.1:2][0x7fa205ef46a0] Returning from external verify block with result: true
default	15:21:41.433846-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C47.1:2][0x7fa205ef46a0] Certificate verification result: OK
default	15:21:41.434652-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:41.435105-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:41.435156-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:41.435200-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:41.435241-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:41.435385-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS 1.3 client done
default	15:21:41.435600-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS client finish_client_handshake
default	15:21:41.435650-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fa205ef46a0] Client handshake state: TLS client done
default	15:21:41.435693-0500	RedLemon	boringssl_context_info_handler(2034) [C47.1:2][0x7fa205ef46a0] Client handshake done
default	15:21:41.437179-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C47.1:2][0x7fa205ef46a0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(148ms) flight_time(134ms) rtt(133ms) write_stalls(0) read_stalls(6)]
default	15:21:41.437386-0500	RedLemon	nw_flow_connected [C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:41.437855-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.282s
default	15:21:41.438137-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state ready
default	15:21:41.438220-0500	RedLemon	[C47 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.283s
default	15:21:41.438360-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.283s
default	15:21:41.438429-0500	RedLemon	[C47 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.283s
default	15:21:41.438775-0500	RedLemon	Connection 47: connected successfully
default	15:21:41.438831-0500	RedLemon	Connection 47: TLS handshake complete
default	15:21:41.439110-0500	RedLemon	Connection 47: ready C(N) E(N)
default	15:21:41.439675-0500	RedLemon	Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:41.439709-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> now using Connection 47
default	15:21:41.439896-0500	RedLemon	Connection 47: received viability advisory(Y)
default	15:21:41.440455-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1555EC24-D1E9-41EC-A45A-EDB94EE9C155] (reporting strategy default)> on Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> was not selected for reporting
default	15:21:41.440692-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> sent request, body N 0
default	15:21:41.441317-0500	RedLemon	Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:41.441647-0500	RedLemon	Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> now using Connection 2
default	15:21:41.442904-0500	RedLemon	0x7fa202afe5a8 ID=352 Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> sent request, body N 0
default	15:21:41.509026-0500	RedLemon	0x7fa202afe5a8 ID=352 Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> received response, status 200 content U
default	15:21:41.509479-0500	RedLemon	Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> response ended
default	15:21:41.509929-0500	RedLemon	Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> done using Connection 2
default	15:21:41.510118-0500	RedLemon	Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> summary for task success {transaction_duration_ms=69, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=68, response_duration_ms=1, request_bytes=500, response_bytes=957, cache_hit=true}
default	15:21:41.510654-0500	RedLemon	Task <D7BD1735-7A51-44EE-A5CC-10295240B33B>.<131> finished successfully
default	15:21:41.511605-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-779 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:41.511825-0500	runningboardd	Assertion 174-4026-779 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:41.512995-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:41.513051-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:41.513179-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:41.516721-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-780 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:41.517254-0500	runningboardd	Assertion 174-114-780 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:41.518802-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:41.518852-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:41.518899-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:41.571280-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> received response, status 101 content U
default	15:21:41.571517-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> response ended
default	15:21:41.571582-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> done using Connection 47
default	15:21:41.572135-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.417s
default	15:21:41.572170-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state preparing
default	15:21:41.572225-0500	RedLemon	[C47 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.417s
default	15:21:41.572314-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.417s
default	15:21:41.572360-0500	RedLemon	[C47 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.417s
default	15:21:41.572408-0500	RedLemon	nw_flow_connected [C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:41.572485-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.417s
default	15:21:41.572551-0500	RedLemon	[C47 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.417s
default	15:21:41.572814-0500	RedLemon	nw_flow_connected [C47.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:41.573924-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.418s
default	15:21:41.574101-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state ready
default	15:21:41.574217-0500	RedLemon	[C47 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.419s
default	15:21:41.697171-0500	RedLemon	nw_flow_disconnected [C47.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:21:41.697968-0500	RedLemon	nw_protocol_tcp_log_summary [C47.1:3]
	[4AB3A990-37F4-4237-83A1-DC59C7F59692 <private>:64923<-><private>:443]
	Init: 1, Conn_Time: 120.811ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 126.312ms, rtt_var: 5.125ms rtt_nc: 123.375ms, rtt_var_nc: 29.250ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:41.701287-0500	RedLemon	tcp_input [C47.1:3] flags=[F.] seq=3236003337, ack=3291737709, win=249 state=ESTABLISHED rcv_nxt=3236003337, snd_una=3291737709
default	15:21:41.702786-0500	RedLemon	[C47.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.547s, error Socket is not connected
default	15:21:41.702838-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state failed error Socket is not connected
default	15:21:41.702903-0500	RedLemon	[C47 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.547s
error	15:21:41.702949-0500	RedLemon	tcp_output [C47.1:3] flags=[R.] seq=3291737840, ack=3236003338, win=2047 state=CLOSED rcv_nxt=3236003338, snd_una=3291737709
error	15:21:41.703248-0500	RedLemon	Connection 47: received failure notification
error	15:21:41.704122-0500	RedLemon	nw_read_request_report [C47] Receive failed with error "Socket is not connected"
error	15:21:41.704265-0500	RedLemon	nw_flow_service_reads [C47.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	15:21:41.704459-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> summary for task success {transaction_duration_ms=552, response_status=101, connection=47, protocol="http/1.1", domain_lookup_duration_ms=6, connect_duration_ms=271, secure_connection_duration_ms=148, private_relay=false, request_start_ms=288, request_duration_ms=0, response_start_ms=419, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	15:21:41.704545-0500	RedLemon	nw_flow_add_write_request [C47.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:21:41.704610-0500	RedLemon	nw_write_request_report [C47] Send failed with error "Socket is not connected"
default	15:21:41.704838-0500	RedLemon	Connection 47: cleaning up
default	15:21:41.704910-0500	RedLemon	[C47 E6FAA9B0-8ABA-449E-B938-476C31C3AFB2 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:21:41.705003-0500	RedLemon	Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:41.704724-0500	RedLemon	Task <8B1F0002-6219-4CFF-AED2-38280FB4DC07>.<1> finished successfully
default	15:21:41.705033-0500	RedLemon	[C47 E6FAA9B0-8ABA-449E-B938-476C31C3AFB2 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C47.1 9BA32C7C-6972-4B26-947C-6B2D4D538309 10.0.0.249:64923<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.549s, DNS @0.000s took 0.006s, TCP @0.417s took 0.122s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:41.705876-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [582D8E43-FF5A-49DA-BA48-415B2C2B1EE9] (reporting strategy default)> on Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> was not selected for reporting
default	15:21:41.709810-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state cancelled error Socket is not connected
default	15:21:41.710155-0500	RedLemon	Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:41.710597-0500	RedLemon	Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> now using Connection 2
default	15:21:41.712388-0500	RedLemon	Connection 47: done
default	15:21:41.712443-0500	RedLemon	0x7fa205d7e268 ID=356 Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> sent request, body N 0
default	15:21:41.771920-0500	RedLemon	0x7fa205d7e268 ID=356 Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> received response, status 200 content U
default	15:21:41.772789-0500	RedLemon	Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> response ended
default	15:21:41.776241-0500	RedLemon	Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> done using Connection 2
default	15:21:41.776724-0500	RedLemon	Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> summary for task success {transaction_duration_ms=67, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=4, request_bytes=511, response_bytes=834, cache_hit=true}
default	15:21:41.776945-0500	RedLemon	Task <E4FF71CB-FA3B-4BC3-A6DC-2C036ED71386>.<132> finished successfully
default	15:21:41.778973-0500	RedLemon	Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:41.779622-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FF089567-E69A-4F0C-AC20-0072760EBFED] (reporting strategy default)> on Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> was not selected for reporting
default	15:21:41.780685-0500	RedLemon	Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:41.781169-0500	RedLemon	Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> now using Connection 2
default	15:21:41.783921-0500	RedLemon	0x7fa205b57098 ID=360 Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> sent request, body N 0
default	15:21:41.904020-0500	RedLemon	0x7fa205b57098 ID=360 Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> received response, status 200 content U
default	15:21:41.904526-0500	RedLemon	Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> response ended
default	15:21:41.904928-0500	RedLemon	Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> done using Connection 2
default	15:21:41.905128-0500	RedLemon	Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> summary for task success {transaction_duration_ms=125, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=123, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:21:41.905438-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	15:21:41.906071-0500	RedLemon	Task <4DBDD2A7-86C5-48F0-94F5-A5470D053FBD>.<133> finished successfully
default	15:21:41.910721-0500	RedLemon	Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:41.911427-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9F06AE5A-D9C9-4611-9D76-9993D05452EB] (reporting strategy default)> on Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> was not selected for reporting
default	15:21:41.913001-0500	RedLemon	Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:41.913449-0500	RedLemon	Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> now using Connection 2
default	15:21:41.918384-0500	RedLemon	0x7fa205dc1fb8 ID=364 Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> sent request, body N 0
default	15:21:41.971843-0500	RedLemon	0x7fa205dc1fb8 ID=364 Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> received response, status 200 content U
default	15:21:41.972455-0500	RedLemon	Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> response ended
default	15:21:41.976062-0500	RedLemon	Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> done using Connection 2
default	15:21:41.976490-0500	RedLemon	Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> summary for task success {transaction_duration_ms=64, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=4, response_start_ms=59, response_duration_ms=4, request_bytes=524, response_bytes=845, cache_hit=true}
default	15:21:41.977000-0500	RedLemon	Task <B88D2785-306B-4AF7-84C1-682E955753C9>.<134> finished successfully
default	15:21:41.977375-0500	RedLemon	🎬 Guest: Starting playback after countdown
default	15:21:41.977581-0500	RedLemon	🎬 Guest: Launching player for Frankenstein
default	15:21:41.977967-0500	RedLemon	   Quality: 1080p
default	15:21:41.978368-0500	RedLemon	   Mode: watchParty
default	15:21:41.978619-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	15:21:42.062323-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	15:21:42.105310-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt1312221/img
default	15:21:42.105617-0500	RedLemon	⏳ Background art loading...
default	15:21:42.105823-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt1312221/img
default	15:21:42.106138-0500	RedLemon	⏳ Logo loading...
default	15:21:42.131747-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:42.132245-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6DD8E90A-F183-4744-A452-24A8D922C377] (reporting strategy default)> on Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> was not selected for reporting
default	15:21:42.132898-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:42.132946-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:42.133097-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> now using Connection 41
default	15:21:42.133490-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> sent request, body N 0
default	15:21:42.133563-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BBB59B3B-C922-4C9A-B61E-B4F106CEF8D3] (reporting strategy default)> on Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> was not selected for reporting
default	15:21:42.134268-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:42.134466-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> now using Connection 41
default	15:21:42.134675-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> sent request, body N 0
default	15:21:42.148022-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> received response, status 200 content K
default	15:21:42.150366-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> done using Connection 41
default	15:21:42.150580-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> response ended
default	15:21:42.151330-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> summary for task success {transaction_duration_ms=18, response_status=200, connection=41, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=15, response_duration_ms=2, request_bytes=36, response_bytes=63077, cache_hit=false}
default	15:21:42.151480-0500	RedLemon	Task <4391B3D5-0ABC-44F7-B881-5EB460BACD97>.<135> finished successfully
default	15:21:42.163381-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> received response, status 200 content K
default	15:21:42.170413-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> done using Connection 41
default	15:21:42.170566-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> response ended
default	15:21:42.171778-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> summary for task success {transaction_duration_ms=37, response_status=200, connection=41, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=28, response_duration_ms=7, request_bytes=41, response_bytes=117927, cache_hit=false}
default	15:21:42.171978-0500	RedLemon	Task <F9B25532-087F-4778-9A8A-BA59DB203036>.<136> finished successfully
default	15:21:42.179480-0500	RedLemon	✅ Background art loaded successfully
default	15:21:42.180080-0500	RedLemon	✅ Logo loaded successfully
default	15:21:42.222417-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	15:21:42.222548-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	15:21:42.222709-0500	RedLemon	Task <A07DA234-8CA0-4826-82A1-09A62CB149C6>.<137> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:42.222714-0500	RedLemon	Task <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:42.222666-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	15:21:42.223140-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:21:42.224636-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5B131A9F-C5D1-48B7-B180-67DBB238D032] (reporting strategy default)> on Task <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138> was not selected for reporting
default	15:21:42.224900-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2CF4116F-EF2D-4D01-80AC-68F4F2025862] (reporting strategy default)> on Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> was not selected for reporting
default	15:21:42.225318-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CB56AE87-5DE8-47F1-B3F4-139A22882901] (reporting strategy default)> on Task <A07DA234-8CA0-4826-82A1-09A62CB149C6>.<137> was not selected for reporting
default	15:21:42.225826-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> now using Connection 9
default	15:21:42.226207-0500	RedLemon	Task <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	15:21:42.226457-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> sent request, body N 0
default	15:21:42.227113-0500	RedLemon	Task <A07DA234-8CA0-4826-82A1-09A62CB149C6>.<137> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	15:21:42.227576-0500	RedLemon	Task <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:42.227897-0500	RedLemon	Task <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138> now using Connection 2
default	15:21:42.229614-0500	RedLemon	⚠️ Lobby: Failed to poll participants: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?select=*&room_id=eq.7KB4, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?select=*&room_id=eq.7KB4, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138>, NSLocalizedDescription=cancelled}
default	15:21:42.231338-0500	RedLemon	Task <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138> done using Connection 2
default	15:21:42.231501-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.231892-0500	RedLemon	Task <A94830AF-B2EC-41AA-B073-3C4D8DA1A017>.<140> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.232229-0500	RedLemon	Task <97884709-C781-42EB-A046-55D796B82E33>.<141> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.232171-0500	RedLemon	0x7fa205a614b8 ID=368 Task <70222E08-159A-4D7C-8DEF-CEEE95CC1FE8>.<138> sent request, body N 0
default	15:21:42.232475-0500	RedLemon	Task <ED0D28BC-10D7-4F81-BC05-5FC64A63E43B>.<142> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.234158-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0BB52B64-6F29-4EF0-9860-19002DCF0ED3] (reporting strategy default)> on Task <A94830AF-B2EC-41AA-B073-3C4D8DA1A017>.<140> was not selected for reporting
default	15:21:42.236346-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [10ADE53F-CD23-4F6D-82BE-7CFECA9B4C41] (reporting strategy default)> on Task <97884709-C781-42EB-A046-55D796B82E33>.<141> was not selected for reporting
default	15:21:42.236699-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [21BC8931-27EB-4C4C-ABA4-B020F49274C3] (reporting strategy default)> on Task <ED0D28BC-10D7-4F81-BC05-5FC64A63E43B>.<142> was not selected for reporting
default	15:21:42.238305-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C271BA7C-6A1E-4D2D-86CC-CF0DA82EB006] (reporting strategy default)> on Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> was not selected for reporting
default	15:21:42.240987-0500	RedLemon	⚠️ Lobby: Failed to poll room state: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?id=eq.7KB4&select=*, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?id=eq.7KB4&select=*, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <A07DA234-8CA0-4826-82A1-09A62CB149C6>.<137>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <A07DA234-8CA0-4826-82A1-09A62CB149C6>.<137>, NSLocalizedDescription=cancelled}
default	15:21:42.244780-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:21:42.247015-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:42.247351-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> now using Connection 13
default	15:21:42.247739-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> sent request, body N 0
default	15:21:42.249438-0500	RedLemon	Task <A94830AF-B2EC-41AA-B073-3C4D8DA1A017>.<140> summary for task success {transaction_duration_ms=9, response_status=200, cache_hit=true}
default	15:21:42.249690-0500	RedLemon	Task <A94830AF-B2EC-41AA-B073-3C4D8DA1A017>.<140> finished successfully
default	15:21:42.249887-0500	RedLemon	Task <97884709-C781-42EB-A046-55D796B82E33>.<141> summary for task success {transaction_duration_ms=7, response_status=200, cache_hit=true}
default	15:21:42.250138-0500	RedLemon	Task <97884709-C781-42EB-A046-55D796B82E33>.<141> finished successfully
default	15:21:42.250493-0500	RedLemon	Task <ED0D28BC-10D7-4F81-BC05-5FC64A63E43B>.<142> summary for task success {transaction_duration_ms=6, response_status=200, cache_hit=true}
default	15:21:42.250567-0500	RedLemon	Task <16813E6A-5894-4729-9DF6-417E4E11043F>.<143> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.250996-0500	RedLemon	Task <ED0D28BC-10D7-4F81-BC05-5FC64A63E43B>.<142> finished successfully
default	15:21:42.252718-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BBCBE606-E23E-49B3-80EC-2C4B5B81B1A3] (reporting strategy default)> on Task <16813E6A-5894-4729-9DF6-417E4E11043F>.<143> was not selected for reporting
default	15:21:42.269217-0500	RedLemon	Task <16813E6A-5894-4729-9DF6-417E4E11043F>.<143> summary for task success {transaction_duration_ms=15, response_status=200, cache_hit=true}
default	15:21:42.269503-0500	RedLemon	Task <16813E6A-5894-4729-9DF6-417E4E11043F>.<143> finished successfully
default	15:21:42.453573-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> received response, status 200 content U
default	15:21:42.561036-0500	RedLemon	🎬 Guest: Starting playback after database fallback detection
default	15:21:42.561309-0500	RedLemon	🎬 Guest: Launching player via database fallback
default	15:21:42.561469-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	15:21:42.561718-0500	RedLemon	   Quality: 1080p
default	15:21:42.561897-0500	RedLemon	   Mode: watchParty
default	15:21:42.562066-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	15:21:42.600733-0500	runningboardd	Invalidating assertion 174-4026-779 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:42.669688-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> done using Connection 13
default	15:21:42.670561-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> response ended
default	15:21:42.670764-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> summary for task success {transaction_duration_ms=425, response_status=200, connection=13, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=208, response_duration_ms=217, request_bytes=483, response_bytes=6952, cache_hit=true}
default	15:21:42.671006-0500	RedLemon	Task <4AB8AB1D-01FC-4DFA-B878-74ADA505449C>.<139> finished successfully
default	15:21:42.702636-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	15:21:42.702887-0500	RedLemon	   INPUT[0]: Frankenstein.2025.2160p.NF.WEB-DL.HDR.MULTi.DDP5.1.Atmos.H265-BEN.THE.MEN
👤 542 💾 36.27 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇷🇺 / 🇮🇹 / 🇵🇹 / 🇪🇸 / 🇫🇷 / 🇩🇪 / 🇮🇳 / 🇵🇱 / 🇺🇦 | 2160p | torrentio
default	15:21:42.703311-0500	RedLemon	   INPUT[1]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:21:42.703547-0500	RedLemon	   INPUT[2]: Frankenstein.2025.2160p.NF.WEB-DL.DV.P5.ENG.LATINO.DDP5.1.Atmos.MP4.H265-BTM
👤 109 💾 22.86 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio
default	15:21:42.704035-0500	RedLemon	   INPUT[3]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	15:21:42.704381-0500	RedLemon	   INPUT[4]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:21:42.704849-0500	RedLemon	   INPUT[5]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	15:21:42.705141-0500	RedLemon	   INPUT[6]: Frankenstein (2025) [MULTi] [2160p] [NF] [WEB-DL] [HDR] [H265] [DDP5.1.Atmos-K83] [Lektor PL i Napisy PL]
👤 18 💾 21.81 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 2160p | torrentio
default	15:21:42.705323-0500	RedLemon	   INPUT[7]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	15:21:42.705498-0500	RedLemon	   INPUT[8]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	15:21:42.705862-0500	RedLemon	   INPUT[9]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	15:21:42.706594-0500	RedLemon	   INPUT[10]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	15:21:42.707274-0500	RedLemon	   INPUT[11]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:21:42.707834-0500	RedLemon	   INPUT[12]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	15:21:42.708270-0500	RedLemon	   INPUT[13]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.DV.H.265-SNAKE
👤 35 💾 3 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.708477-0500	RedLemon	   INPUT[14]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.708775-0500	RedLemon	   INPUT[15]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.HDR.H.265-SNAKE
👤 12 💾 4.19 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.709971-0500	RedLemon	   INPUT[16]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	15:21:42.710383-0500	RedLemon	   INPUT[17]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.710736-0500	RedLemon	   INPUT[18]: Frankenstein.2025.1080p.WEB.h264-ETHEL
👤 175 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.711005-0500	RedLemon	   INPUT[19]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:21:42.711282-0500	RedLemon	   INPUT[20]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:21:42.711668-0500	RedLemon	   INPUT[21]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.712126-0500	RedLemon	   INPUT[22]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.712297-0500	RedLemon	   INPUT[23]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.712551-0500	RedLemon	   INPUT[24]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
👤 122 💾 5.98 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:42.713852-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-781 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:42.712730-0500	RedLemon	   INPUT[25]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:42.712990-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	15:21:42.713172-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.81 GB ⚙️ YTS | 1080p | torrentio
default	15:21:42.713335-0500	RedLemon	   INPUT[28]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:21:42.713676-0500	RedLemon	   INPUT[29]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.714499-0500	RedLemon	   INPUT[30]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:42.714675-0500	RedLemon	   INPUT[31]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.715675-0500	RedLemon	   INPUT[32]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.716011-0500	RedLemon	   INPUT[33]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.716177-0500	RedLemon	   INPUT[34]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:21:42.716330-0500	RedLemon	   INPUT[35]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	15:21:42.717725-0500	RedLemon	   INPUT[36]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	15:21:42.718298-0500	RedLemon	   INPUT[37]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:21:42.718720-0500	RedLemon	   INPUT[38]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.719434-0500	RedLemon	   INPUT[39]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:42.720362-0500	RedLemon	   INPUT[40]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.721312-0500	RedLemon	   INPUT[41]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.722002-0500	RedLemon	   INPUT[42]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:42.722739-0500	RedLemon	   INPUT[43]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:42.723017-0500	RedLemon	   INPUT[44]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:42.723241-0500	RedLemon	   INPUT[45]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	15:21:42.723431-0500	RedLemon	   INPUT[46]: Frankenstein (2025) [MULTi] [1080p] [NF] [WEB-DL] [H264] [DDP5.1.Atmos-K83[ [Lektor PL i Napisy PL]
👤 9 💾 6.66 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 1080p | torrentio
default	15:21:42.723697-0500	RedLemon	   INPUT[47]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:21:42.723859-0500	RedLemon	   INPUT[48]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.724102-0500	RedLemon	   INPUT[49]: Frankenstein.2025.WEB-DL.1080p-Dual-Lat
👤 7 💾 6.8 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:21:42.724277-0500	RedLemon	   INPUT[50]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:42.724483-0500	RedLemon	   INPUT[51]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.724677-0500	RedLemon	   INPUT[52]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.724905-0500	RedLemon	   INPUT[53]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.725058-0500	RedLemon	   INPUT[54]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	15:21:42.725450-0500	RedLemon	   INPUT[55]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:42.725653-0500	RedLemon	   INPUT[56]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.726027-0500	RedLemon	   INPUT[57]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:42.727894-0500	runningboardd	Assertion 174-4026-781 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:42.726924-0500	RedLemon	   INPUT[58]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:42.727401-0500	RedLemon	   INPUT[59]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	15:21:42.727684-0500	RedLemon	   INPUT[60]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	15:21:42.728246-0500	RedLemon	   INPUT[61]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	15:21:42.728586-0500	RedLemon	   INPUT[62]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:42.729095-0500	RedLemon	   INPUT[63]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:21:42.729280-0500	RedLemon	   INPUT[64]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:42.730232-0500	RedLemon	   INPUT[65]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	15:21:42.730632-0500	RedLemon	   INPUT[66]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:21:42.730986-0500	RedLemon	   INPUT[67]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:42.731790-0500	RedLemon	   INPUT[68]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	15:21:42.732932-0500	RedLemon	   INPUT[69]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:42.733310-0500	RedLemon	   INPUT[70]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:21:42.733711-0500	RedLemon	   INPUT[71]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	15:21:42.734101-0500	RedLemon	   INPUT[72]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:21:42.734298-0500	RedLemon	   INPUT[73]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:21:42.734607-0500	RedLemon	   INPUT[74]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:21:42.734782-0500	RedLemon	   INPUT[75]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	15:21:42.735054-0500	RedLemon	   INPUT[76]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:21:42.735227-0500	RedLemon	   INPUT[77]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	15:21:42.735416-0500	RedLemon	   INPUT[78]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	15:21:42.736007-0500	RedLemon	   INPUT[79]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:21:42.736526-0500	RedLemon	   INPUT[80]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:21:42.736835-0500	RedLemon	   INPUT[81]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:21:42.737306-0500	RedLemon	   INPUT[82]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:21:42.737843-0500	RedLemon	   INPUT[83]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	15:21:42.738153-0500	RedLemon	   INPUT[84]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	15:21:42.738440-0500	RedLemon	   INPUT[85]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:21:42.738960-0500	RedLemon	   INPUT[86]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:21:42.739238-0500	RedLemon	   INPUT[87]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	15:21:42.740130-0500	RedLemon	   INPUT[88]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	15:21:42.740770-0500	RedLemon	   INPUT[89]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	15:21:42.741223-0500	RedLemon	   INPUT[90]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	15:21:42.741468-0500	RedLemon	   INPUT[91]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	15:21:42.741801-0500	RedLemon	   INPUT[92]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	15:21:42.742140-0500	RedLemon	   INPUT[93]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	15:21:42.742343-0500	RedLemon	   INPUT[94]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	15:21:42.742603-0500	RedLemon	   INPUT[95]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:21:42.742794-0500	RedLemon	   INPUT[96]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	15:21:42.742975-0500	RedLemon	   INPUT[97]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	15:21:42.743693-0500	RedLemon	   INPUT[98]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:21:42.743958-0500	RedLemon	   INPUT[99]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	15:21:42.744210-0500	RedLemon	   INPUT[100]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	15:21:42.744497-0500	RedLemon	   INPUT[101]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	15:21:42.744772-0500	RedLemon	   INPUT[102]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	15:21:42.745028-0500	RedLemon	   INPUT[103]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:21:42.745277-0500	RedLemon	   INPUT[104]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	15:21:42.745526-0500	RedLemon	   INPUT[105]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	15:21:42.745856-0500	RedLemon	   INPUT[106]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	15:21:42.746088-0500	RedLemon	   INPUT[107]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	15:21:42.746366-0500	RedLemon	   INPUT[108]: FRANKENSTEIN mkv | Unknown | zilean
default	15:21:42.746676-0500	RedLemon	   INPUT[109]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	15:21:42.747196-0500	RedLemon	   INPUT[110]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	15:21:42.747526-0500	RedLemon	   INPUT[111]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	15:21:42.748034-0500	RedLemon	   INPUT[112]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	15:21:42.749453-0500	RedLemon	   INPUT[113]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	15:21:42.749772-0500	RedLemon	   INPUT[114]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	15:21:42.750078-0500	RedLemon	   INPUT[115]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	15:21:42.750464-0500	RedLemon	   INPUT[116]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:21:42.750711-0500	RedLemon	   INPUT[117]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	15:21:42.750904-0500	RedLemon	   INPUT[118]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	15:21:42.751071-0500	RedLemon	   INPUT[119]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	15:21:42.752063-0500	RedLemon	   INPUT[120]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	15:21:42.752279-0500	RedLemon	   INPUT[121]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	15:21:42.752521-0500	RedLemon	   INPUT[122]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	15:21:42.752706-0500	RedLemon	   INPUT[123]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	15:21:42.752964-0500	RedLemon	   INPUT[124]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	15:21:42.753139-0500	RedLemon	   INPUT[125]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	15:21:42.753458-0500	RedLemon	   INPUT[126]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	15:21:42.753707-0500	RedLemon	   INPUT[127]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	15:21:42.753956-0500	RedLemon	   INPUT[128]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	15:21:42.754219-0500	RedLemon	   INPUT[129]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	15:21:42.754522-0500	RedLemon	   INPUT[130]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	15:21:42.754698-0500	RedLemon	   INPUT[131]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	15:21:42.755081-0500	RedLemon	   INPUT[132]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	15:21:42.755301-0500	RedLemon	   INPUT[133]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	15:21:42.756577-0500	RedLemon	   INPUT[134]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	15:21:42.756973-0500	RedLemon	   INPUT[135]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	15:21:42.757153-0500	RedLemon	   INPUT[136]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	15:21:42.758058-0500	RedLemon	   INPUT[137]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	15:21:42.758316-0500	RedLemon	   INPUT[138]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	15:21:42.758805-0500	RedLemon	   INPUT[139]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	15:21:42.759012-0500	RedLemon	   INPUT[140]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	15:21:42.759957-0500	RedLemon	   INPUT[141]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	15:21:42.760212-0500	RedLemon	   INPUT[142]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	15:21:42.760416-0500	RedLemon	   INPUT[143]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	15:21:42.760607-0500	RedLemon	   INPUT[144]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	15:21:42.761040-0500	RedLemon	   INPUT[145]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	15:21:42.761234-0500	RedLemon	   INPUT[146]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	15:21:42.761554-0500	RedLemon	   INPUT[147]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	15:21:42.761915-0500	RedLemon	   INPUT[148]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	15:21:42.762238-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.762587-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.765049-0500	runningboardd	Attempting to rename power assertion 33392 for target anon<RedLemon>(501) to anon<RedLemon>(501);174-4026-779:com.apple.CFNetwork.StorageDB;174-4026-781:com.apple.CFNetwork.StorageDB
default	15:21:42.763395-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.763875-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.764662-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.764880-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.765388-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.765537-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.765636-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.765733-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.767091-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.767796-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.769009-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.769859-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	15:21:42.770015-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	15:21:42.769807-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.770162-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.770138-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	15:21:42.770781-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.770988-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:21:42.771115-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.772192-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9C84A062-8F7F-4C3B-8C1C-83438C460030] (reporting strategy default)> on Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> was not selected for reporting
default	15:21:42.771915-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.772563-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.773017-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.773610-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> now using Connection 38
default	15:21:42.773557-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.774175-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> sent request, body N 0
default	15:21:42.774189-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.774590-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.774909-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.775049-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.775324-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:42.775470-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.775674-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.776045-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.776242-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.776590-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.776822-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.777010-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.777132-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.777344-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.777529-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.777640-0500	RedLemon	Task <95870CFB-1E71-4D3D-A955-641A482C8A72>.<145> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.777569-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.777873-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.777878-0500	RedLemon	Task <CBF1E0B6-773E-40DB-8257-205C81DB4063>.<146> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.778542-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.778873-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.779589-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.780287-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.780870-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.781841-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.782571-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [10B8C32B-5BC5-41A3-AC4E-25E7D88BEDAA] (reporting strategy default)> on Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> was not selected for reporting
default	15:21:42.782464-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.783021-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [38DD9DC0-1780-4D64-B938-333A03225DDC] (reporting strategy default)> on Task <95870CFB-1E71-4D3D-A955-641A482C8A72>.<145> was not selected for reporting
default	15:21:42.783303-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.783442-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4212279E-254B-4046-881C-5EE37A679B0D] (reporting strategy default)> on Task <CBF1E0B6-773E-40DB-8257-205C81DB4063>.<146> was not selected for reporting
default	15:21:42.783350-0500	RedLemon	Task <1C0ED2F9-30B2-4476-823A-4AA7AE2546A5>.<147> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.784049-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:42.784018-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.780101-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:42.788012-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:42.788085-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:42.784811-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.784816-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> now using Connection 13
default	15:21:42.786043-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.787672-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.788446-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> sent request, body N 0
default	15:21:42.788697-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:42.788465-0500	RedLemon	Task <95870CFB-1E71-4D3D-A955-641A482C8A72>.<145> summary for task success {transaction_duration_ms=4, response_status=200, cache_hit=true}
default	15:21:42.789203-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	15:21:42.789880-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 720p | 720p | comet
default	15:21:42.790328-0500	RedLemon	   INPUT[201]: [RD⚡] Comet 720p | 720p | comet
default	15:21:42.790678-0500	RedLemon	   INPUT[202]: [RD⚡] Comet 480p | 480p | comet
default	15:21:42.790801-0500	RedLemon	Task <95870CFB-1E71-4D3D-A955-641A482C8A72>.<145> finished successfully
default	15:21:42.791107-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	15:21:42.791609-0500	RedLemon	Task <CBF1E0B6-773E-40DB-8257-205C81DB4063>.<146> summary for task success {transaction_duration_ms=5, response_status=200, cache_hit=true}
default	15:21:42.791704-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1A00F381-8CB7-4A61-86D6-0CBD4D720F5F] (reporting strategy default)> on Task <1C0ED2F9-30B2-4476-823A-4AA7AE2546A5>.<147> was not selected for reporting
default	15:21:42.791532-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	15:21:42.792076-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	15:21:42.792350-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	15:21:42.792989-0500	RedLemon	Task <CBF1E0B6-773E-40DB-8257-205C81DB4063>.<146> finished successfully
default	15:21:42.793056-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	15:21:42.793855-0500	RedLemon	Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:42.794944-0500	RedLemon	Task <1C0ED2F9-30B2-4476-823A-4AA7AE2546A5>.<147> summary for task success {transaction_duration_ms=1, response_status=200, cache_hit=true}
default	15:21:42.795954-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A61E8D7D-4DCD-4361-B0F0-783DFC0EB943] (reporting strategy default)> on Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> was not selected for reporting
default	15:21:42.796075-0500	RedLemon	Task <1C0ED2F9-30B2-4476-823A-4AA7AE2546A5>.<147> finished successfully
default	15:21:42.801188-0500	RedLemon	Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:42.801592-0500	RedLemon	Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> now using Connection 19
default	15:21:42.802894-0500	RedLemon	0x7fa205a26b68 ID=4 Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> sent request, body N 0
default	15:21:42.807658-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:42.807715-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:42.807770-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:42.807923-0500	runningboardd	Attempting to rename power assertion 33392 for target anon<RedLemon>(501) to anon<RedLemon>(501)174-4026-781:com.apple.CFNetwork.StorageDB
default	15:21:42.960397-0500	RedLemon	0x7fa205a26b68 ID=4 Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> received response, status 200 content K
default	15:21:42.960958-0500	RedLemon	Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> response ended
default	15:21:42.961461-0500	RedLemon	Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> done using Connection 19
default	15:21:42.962266-0500	RedLemon	Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> summary for task success {transaction_duration_ms=165, response_status=200, connection=19, reused=1, request_start_ms=4, request_duration_ms=1, response_start_ms=163, response_duration_ms=2, request_bytes=166, response_bytes=1384, cache_hit=true}
default	15:21:42.962871-0500	RedLemon	Task <DEE345E4-C4A9-459D-974E-7A39BF692DF0>.<148> finished successfully
default	15:21:42.966609-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	15:21:42.966849-0500	RedLemon	✅ Filtered to 4 English subtitles
default	15:21:42.967744-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	15:21:42.968143-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	15:21:42.969357-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:42.970129-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:42.970360-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:42.970845-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:42.971101-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:42.971515-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:42.971626-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:42.971996-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:42.972135-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:42.973326-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:42.973562-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:42.978176-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:42.978591-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:42.979512-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:42.979970-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:42.980173-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:42.981560-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:42.982255-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:42.982753-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:42.983184-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:42.983429-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:42.983609-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:42.984195-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:42.984327-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:42.989151-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:42.991667-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:42.994843-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:42.995115-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:42.995290-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:42.995954-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:42.996117-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:42.996469-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:42.996653-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:42.997252-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:42.997554-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:42.998296-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:42.998778-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:42.998933-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:42.999317-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.999536-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.999703-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.008699-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.009104-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.013209-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.013427-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.013794-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.013967-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.015161-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.016163-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.016712-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.016906-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.017339-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.017554-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.017723-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.019602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.026951-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.027462-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.027848-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.028038-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.028738-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.029654-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.029834-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.030240-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.030483-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.030647-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.031466-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.031616-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.032099-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.032278-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.032712-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.032978-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.033180-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.040107-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.040262-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.040623-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.041079-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.041433-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.041851-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.042037-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.042347-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.042496-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.042632-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.043220-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.043597-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.044003-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.044176-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.051361-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.053241-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.053455-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.053930-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.054177-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.054663-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.054851-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.055162-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.055320-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.055453-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.055808-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.056407-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.057203-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.057566-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.058211-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.058399-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.058538-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.059037-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.059262-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.060069-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.060579-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.060740-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.060892-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.061194-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.062352-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.071734-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.073118-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.073621-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.073797-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.073915-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.074301-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.074700-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.074857-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.075253-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.075418-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.075774-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.076138-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.076450-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.076844-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.076998-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.077450-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.079094-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.079492-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.080096-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.080495-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.081372-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.088330-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.088598-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.088866-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.089566-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.089824-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.090318-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.090522-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.090651-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.091173-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.091399-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.091933-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.092190-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.092685-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.093053-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.093216-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.094346-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.094554-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.094727-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.095206-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.095463-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.095660-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.096198-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.096398-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.096544-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.096971-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.097162-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.097803-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.098022-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.099231-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.100025-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.100488-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.102407-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.103616-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.103866-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.105710-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.106790-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.107482-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.107794-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.108596-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.109723-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.109899-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> received response, status 200 content U
default	15:21:43.110502-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.111216-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.111557-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.112147-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.112657-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.112880-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.113341-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.113826-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.114418-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.115099-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.115942-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.116687-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.116883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.117153-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.117891-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.118154-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.118649-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.119154-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.119869-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.120124-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.120275-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.121042-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.121854-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.122039-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.123243-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.123476-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.124166-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.124527-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.124839-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.125317-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.125700-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.126246-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.126648-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.127680-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.128249-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.128645-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.129640-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.130681-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.131454-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.132623-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.134938-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.135656-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.135824-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.136617-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.137006-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.137264-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.137723-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.137909-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.138448-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.138740-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.139333-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.139647-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.140171-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.141031-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.141288-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.141908-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.142384-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.142658-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.143860-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.144094-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.144428-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.145057-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.145267-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.145986-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.146775-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.147191-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.147948-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.148475-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.149385-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.149903-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.150636-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.151664-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.152441-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.152791-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.153384-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.154299-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.154928-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.155147-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.155857-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.156152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.156928-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.157767-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.157965-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.158122-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.158653-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.158901-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.159770-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.160176-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.160342-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.161175-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.161359-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.161514-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.162555-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.162899-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.163216-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.163912-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.164433-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.164877-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.165612-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.166096-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.167197-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.167455-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.167640-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.168673-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.168966-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.169692-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.169883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.170094-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.170758-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.171154-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.171358-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.172101-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.172295-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.172518-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.173508-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.173710-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.173995-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.174659-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.174962-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.175400-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.175915-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.176295-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.176942-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.177093-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.177331-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.178105-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.178980-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.179523-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.179975-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.180155-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.181281-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.182791-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.183602-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.184156-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.185066-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.185667-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.186428-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.187068-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.187334-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.188116-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.188497-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.188873-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.189650-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.190040-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.190979-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.191222-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.191462-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.192203-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.192677-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.192908-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.193649-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.194458-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.194842-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.195674-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.195871-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.196021-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.197048-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.197356-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.198055-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.198271-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.199414-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.199641-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.200201-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.201194-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.202620-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.203854-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.205451-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.206703-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.206917-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.207520-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.207686-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.207823-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.208178-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.208719-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.209392-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.209530-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.209610-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.209907-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.210059-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.210201-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.210634-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.210850-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.211208-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.211585-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.211967-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.212296-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.212449-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.212589-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.212951-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.213557-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.218705-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.218899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.219014-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.219433-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.219623-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.220921-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.221159-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.221344-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.222361-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.222569-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.223089-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.223474-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.225126-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.225744-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.225991-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.226511-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.226706-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.226826-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.227296-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.227762-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.227973-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.228399-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.228621-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.228781-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.229142-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.229408-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.229943-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.230112-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.230252-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.230616-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.230775-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.231497-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.232156-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.232506-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.232661-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.232803-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.233165-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.233341-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.233870-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.242746-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.242901-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.243458-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.243805-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.243977-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.244443-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.244780-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.244978-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.246185-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.246681-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.246877-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.247454-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.250053-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.250854-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.251074-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.251256-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.251775-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.252023-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.252991-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.254569-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.254693-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.254991-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.256961-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.257234-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.258508-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.258728-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.260092-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.260374-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.262972-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.263202-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.263801-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.264575-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.264967-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.267198-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.270045-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.271133-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.272684-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.272878-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.273931-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.274372-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.274808-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.275013-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.275353-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.275943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.276104-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.276492-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.276941-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.277978-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.278542-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.278676-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.279169-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.279964-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.280361-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.280569-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.281502-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.282409-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.282671-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.283142-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.283387-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.283586-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.284065-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.284761-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.284986-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.285414-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.285626-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.286112-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.286258-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.286680-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.287101-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.287297-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.287815-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.287971-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.288727-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.288882-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.290097-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.290348-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.290833-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.291347-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.291491-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.291929-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.292306-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.292464-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.292985-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.293431-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.293582-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.294042-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.294261-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.294533-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.295401-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.295665-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.295867-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.296277-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.296457-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.296613-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.297157-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.297396-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.298145-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.298367-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.298583-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.299004-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.299405-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.299665-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.301529-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.301835-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.302386-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.303025-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.303395-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.304847-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.305125-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.305900-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.307786-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.307987-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.308923-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.309150-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.309767-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.310348-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.310489-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.311005-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.311274-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.311508-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.312087-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.312634-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.312901-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.313529-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.313807-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.314011-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.314847-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.315639-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.315866-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.316565-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.316891-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.317163-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.318136-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.318993-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.319843-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.320694-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.321268-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.321764-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.322504-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.322861-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.323550-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.323690-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.324127-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.324361-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.324559-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.325067-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.325226-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.325870-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.326116-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.326572-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.326752-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.327130-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.327297-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.327440-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.327773-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.328035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.328272-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.328908-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.329073-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> done using Connection 13
default	15:21:43.329190-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.329482-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> response ended
default	15:21:43.329615-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.329914-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> summary for task success {transaction_duration_ms=546, response_status=200, connection=13, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=326, response_duration_ms=219, request_bytes=483, response_bytes=6896, cache_hit=true}
default	15:21:43.330034-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.330220-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.330342-0500	RedLemon	Task <18ED0429-FB2A-400F-9BE7-4A6C979C3CC6>.<144> finished successfully
default	15:21:43.330575-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.330755-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.331269-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.332662-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.333394-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.333981-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.334376-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.334564-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.334908-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.335289-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.335439-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.335781-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.335961-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.336339-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.336548-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.336944-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.337100-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.337450-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.337616-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.337982-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.338180-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.338907-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.339798-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.340224-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.341820-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.342411-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.343101-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.343508-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.344026-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.344413-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.344609-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.344976-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.345129-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.345459-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.345623-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.345962-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.346155-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.346606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.346764-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.347220-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.347703-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.348016-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.348402-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.348988-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.349196-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.349838-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.350039-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.350474-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.350719-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.351157-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.351413-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.351614-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.351980-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.352267-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.352564-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.352966-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.353283-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.353945-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.354135-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.354507-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.354863-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.355031-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.355170-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.355515-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.355674-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	15:21:43.356096-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:21:43.356379-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.356472-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	15:21:43.356666-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	15:21:43.356847-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:21:43.357016-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:21:43.357116-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.357187-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:21:43.357343-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:21:43.357420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.357537-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	15:21:43.357641-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.357706-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	15:21:43.357986-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	15:21:43.358037-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.358222-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.358211-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	15:21:43.358448-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:21:43.358623-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	15:21:43.358820-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.358969-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:21:43.359052-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.359155-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:21:43.359333-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	15:21:43.359671-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	15:21:43.359760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.360166-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.360171-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	15:21:43.360621-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	15:21:43.360866-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	15:21:43.360972-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.361109-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	15:21:43.361294-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	15:21:43.361177-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.361856-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.362087-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	15:21:43.362270-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	15:21:43.362417-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.362488-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:21:43.362665-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	15:21:43.362751-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.362910-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.362986-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:21:43.363059-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.363147-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	15:21:43.363301-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	15:21:43.363411-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.363451-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	15:21:43.363579-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.363598-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:21:43.363746-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	15:21:43.363898-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	15:21:43.363895-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.364044-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	15:21:43.364053-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.364190-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	15:21:43.364345-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:21:43.364370-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.364506-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	15:21:43.364512-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.364646-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.364653-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	15:21:43.364799-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	15:21:43.365055-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	15:21:43.365212-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	15:21:43.365370-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	15:21:43.365447-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.366105-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.365531-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	15:21:43.366806-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	15:21:43.366614-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.367069-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	15:21:43.367311-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	15:21:43.367615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.367913-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.368135-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	15:21:43.368779-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	15:21:43.369112-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:21:43.369218-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.369432-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	15:21:43.369534-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.369690-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	15:21:43.369983-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	15:21:43.370273-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.370424-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	15:21:43.370620-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	15:21:43.370832-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	15:21:43.370874-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.371017-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.371150-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	15:21:43.371365-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	15:21:43.371542-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.371551-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	15:21:43.371817-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	15:21:43.372006-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.372073-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	15:21:43.372246-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	15:21:43.372435-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.372464-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	15:21:43.372685-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	15:21:43.372778-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.373019-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.373099-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	15:21:43.373282-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	15:21:43.373466-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	15:21:43.373636-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	15:21:43.373886-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.374121-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	15:21:43.374243-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.374311-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	15:21:43.374524-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	15:21:43.375094-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	15:21:43.375247-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.375294-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	15:21:43.375561-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	15:21:43.375775-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	15:21:43.375958-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	15:21:43.376147-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	15:21:43.376045-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.376327-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	15:21:43.376358-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.376492-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	15:21:43.376665-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	15:21:43.376842-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	15:21:43.377017-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.377019-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	15:21:43.377322-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.377712-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:21:43.377933-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	15:21:43.378371-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.378334-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:21:43.378619-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	15:21:43.378674-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.378912-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	15:21:43.379062-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	15:21:43.379093-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.379189-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	15:21:43.379231-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.379328-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	15:21:43.379466-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:21:43.379543-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.379594-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	15:21:43.379699-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.379724-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.379854-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	15:21:43.379983-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.379987-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.381040-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.381113-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:21:43.381573-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:21:43.381653-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.381745-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.381905-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.382038-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.382173-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:43.382282-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.382291-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	15:21:43.382419-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:21:43.382544-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.382669-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:43.382800-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.382838-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.382926-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.382978-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.383050-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.383181-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:21:43.383306-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	15:21:43.383357-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.383424-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	15:21:43.383521-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.383546-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:21:43.383671-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.383799-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:43.383853-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.383928-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.383980-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.384052-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:43.384180-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:43.384506-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:43.384574-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.384711-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.384906-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	15:21:43.385061-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:21:43.385059-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.385204-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.385230-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.385329-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	15:21:43.385447-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.385581-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.385737-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.385840-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.385870-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.386075-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	15:21:43.386214-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:21:43.386568-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.387113-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.387265-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:21:43.387399-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:43.387434-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.387540-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	15:21:43.387598-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.387665-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	15:21:43.387787-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	15:21:43.387909-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:43.388000-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.388048-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:21:43.388160-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:43.388173-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.388274-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.388279-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	15:21:43.388406-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:21:43.388842-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:21:43.389008-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	15:21:43.389204-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:21:43.389373-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.389695-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:21:43.389707-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.389838-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	15:21:43.389971-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:21:43.390108-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:21:43.390820-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.391042-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.391096-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:21:43.391841-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	15:21:43.392031-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:21:43.392174-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	15:21:43.392883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.392321-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	15:21:43.393428-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.393429-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.393546-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.393651-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.393753-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.393807-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.393851-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.393948-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.393945-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.394045-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.394196-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.394321-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.394262-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.394501-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.394907-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.395129-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395256-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395373-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395479-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395584-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395642-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.395684-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395761-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.395777-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395864-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.395965-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396051-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.396064-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396162-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396260-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396356-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396452-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396548-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396647-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	15:21:43.396743-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.396842-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.396938-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.397037-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.397138-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.397237-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.397701-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.397871-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.397881-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.397999-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.398454-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.398653-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.399081-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.399317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.399463-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.400681-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.400753-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.400804-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.400891-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.400902-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.401177-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.401417-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402152-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402159-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.402287-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402328-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.402403-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402514-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402621-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402729-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402750-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.402833-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.402895-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.402937-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.403052-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.403058-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.403156-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.403256-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 1080p | 1080p | comet
default	15:21:43.403356-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	15:21:43.403454-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 720p | 720p | comet
default	15:21:43.403549-0500	RedLemon	   INPUT[201]: [RD⚡] Comet 720p | 720p | comet
default	15:21:43.403548-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.403742-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.403872-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.404361-0500	RedLemon	   INPUT[202]: [RD⚡] Comet 480p | 480p | comet
default	15:21:43.404500-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	15:21:43.404546-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.404608-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	15:21:43.404706-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	15:21:43.404723-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.404803-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	15:21:43.405242-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.405389-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.405699-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.405880-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.404916-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	15:21:43.406172-0500	RedLemon	Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:43.406244-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.406414-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.406625-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DEC04EE3-2F69-41CE-9C28-3C7E42639D85] (reporting strategy default)> on Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> was not selected for reporting
default	15:21:43.407994-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.408261-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.408539-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.409106-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.409352-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.409508-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.409780-0500	RedLemon	Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:43.409863-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.410041-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.410415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.410613-0500	RedLemon	Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> now using Connection 19
default	15:21:43.410623-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.410959-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.412266-0500	RedLemon	0x7fa206e92448 ID=8 Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> sent request, body N 0
default	15:21:43.412573-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.413006-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.413328-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.413999-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.414505-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.414980-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.415148-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.415790-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.416018-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.416677-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.416868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.417012-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.417495-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.417671-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.417819-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.418323-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.418629-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.419033-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.419218-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.419650-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.420195-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.420506-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.420665-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.421446-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.421741-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.422219-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.422403-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.423110-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.423716-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.423913-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.424371-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.424912-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.425225-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.426094-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.426274-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.427118-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.427352-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.427793-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.428015-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.428724-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.429027-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.429219-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.430103-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.430546-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.432137-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.432399-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.432893-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.433233-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.433398-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.434142-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.434317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.434592-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.435621-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.435836-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.436537-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.436857-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.437108-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.437443-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.437702-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.437899-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.438462-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.439163-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.440260-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.440459-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.440845-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.441616-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.441883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.442409-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.442918-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.443129-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.443937-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.444375-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.445010-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.445189-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.445568-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.445780-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.446419-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.446597-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.446741-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.447093-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.447276-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.447695-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.448132-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.449826-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.450284-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.450426-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.451807-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.452579-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.455073-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.460755-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.461342-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.468796-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.469285-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.469445-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.470036-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.470196-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.470386-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.470735-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.471153-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.471952-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.472125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.472249-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.473282-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.473453-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.473634-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.473979-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.474256-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.474658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.475553-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.476320-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.476495-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.477073-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.477294-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.477658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.477793-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.478125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.478279-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.478612-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.478790-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.479146-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.479280-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.479652-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.479799-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.480140-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.480324-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.481648-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.481831-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.482131-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.482461-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.482614-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.485706-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.488177-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.488450-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.491996-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.492193-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.496232-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.496427-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.503606-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.504369-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.508311-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.508505-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.508977-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.509906-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.510628-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.511699-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.512084-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.512823-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.513087-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.513858-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.514048-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.515496-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.515686-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.515856-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.516606-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.516779-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.518549-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.519076-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.519366-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.519762-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.520107-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.520771-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.521749-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.521928-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.522196-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.522950-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.523206-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.523761-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.523969-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.524472-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.524895-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.525057-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.525686-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.525949-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.527646-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.528049-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.528207-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.531171-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.531625-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.531791-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.532195-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.532568-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.533000-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.533454-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.534573-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.534991-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.535152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.535339-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.536560-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.537399-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.538547-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.539033-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.539213-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.540508-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.540693-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.541109-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.542143-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.542551-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.544419-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.544713-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.544867-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.545207-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.545844-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.546348-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.547099-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.547447-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.548155-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.548398-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.548544-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.549166-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.549351-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.549765-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.550179-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.550614-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.551316-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.551734-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.551913-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.552747-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.552917-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.553353-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.553709-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.553874-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.554277-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.554424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.554541-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.554914-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.555578-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.557003-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.558269-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.558764-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.559410-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.560523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.561084-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.561808-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.561995-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.562809-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.563555-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.563997-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.564584-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.565125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.565418-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.566019-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.566209-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.567291-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.568037-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.568250-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.568821-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.569235-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.569391-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.570059-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.570235-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.570699-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.571518-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.571805-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.572207-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.572734-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.572979-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.573647-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.573880-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.574218-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.575120-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.575381-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.576317-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.578754-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.578876-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.579273-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.579399-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.579513-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.581887-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.582068-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.582369-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.582516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.582629-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.582906-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.583039-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.591942-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.592334-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.592525-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.592849-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.593060-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.593435-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.596393-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.596587-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.596709-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.597032-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.597187-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.597507-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.597620-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.605110-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.606019-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.606969-0500	RedLemon	0x7fa206e92448 ID=8 Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> received response, status 200 content K
default	15:21:43.607121-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.608429-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.610172-0500	RedLemon	Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> response ended
default	15:21:43.610373-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.613081-0500	RedLemon	Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> done using Connection 19
default	15:21:43.613599-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	15:21:43.611644-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.615608-0500	RedLemon	Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> summary for task success {transaction_duration_ms=206, response_status=200, connection=19, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=196, response_duration_ms=7, request_bytes=166, response_bytes=1387, cache_hit=true}
default	15:21:43.615860-0500	RedLemon	Task <87810CBC-D7CF-4F9B-9924-1728552ACA90>.<149> finished successfully
default	15:21:43.614770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.617690-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	15:21:43.617852-0500	RedLemon	✅ Filtered to 4 English subtitles
default	15:21:43.617851-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.618442-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.618611-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.618634-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	15:21:43.618752-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	15:21:43.618952-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.619601-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.619981-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.619029-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.620136-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.620223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.620336-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.620445-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.621561-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.621970-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.622095-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.620616-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.622554-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.622925-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.623274-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.623440-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.623753-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.624214-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.628030-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.628225-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.622567-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.628767-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.629221-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.629575-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.629751-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.631532-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.631899-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.633126-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.633475-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.633619-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.633745-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.630722-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.634144-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.634509-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.634680-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.634809-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.635142-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.635365-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.635742-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.635937-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.636331-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.636415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.636548-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.636697-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.637772-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.638267-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.637165-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.638598-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.639166-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.639389-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.639394-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.639904-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.639930-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.640135-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.640933-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.641000-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.641897-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.642056-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.642414-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.642458-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.642595-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.642745-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.642888-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.642896-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.643053-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.643491-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.643718-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.643845-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.643867-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.643970-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.644165-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.644306-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.644347-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.644582-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.644850-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.644920-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.645100-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.645214-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.645464-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.645747-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.645803-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.645878-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.645942-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.646261-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.646429-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.646435-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.646712-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.646783-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.646908-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.647289-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.647207-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.648538-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.648747-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.649004-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.649060-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.649132-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.649209-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.649424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.649617-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.649617-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.649831-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.650085-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.650204-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.650274-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.650369-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.650639-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.650682-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.650764-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.651043-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.651068-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.651201-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.651207-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.651496-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.651525-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.651684-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.651679-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.652053-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.652221-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.652389-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.652687-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.652915-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.652987-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.653256-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.653819-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.654120-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.654541-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.654561-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.654747-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.655113-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.655446-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.655502-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.656012-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.656198-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.656198-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.656645-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.656846-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.656974-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.657151-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.657608-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.657630-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.658016-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.658178-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.658387-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.658404-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.658740-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.659182-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.659379-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.659487-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.659670-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.659748-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.659945-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.660603-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.660813-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.660815-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.660952-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.661017-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.661268-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.661294-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.661396-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.661433-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.661706-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.661871-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.662002-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.662121-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.662189-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.662302-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.662400-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.662519-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.662573-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.662693-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.662796-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.662941-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.662986-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.663135-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.663358-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.663495-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.663532-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.663655-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.663702-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.663788-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.663964-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.663964-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.664064-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.664345-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.664900-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.665102-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.665204-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.665270-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.665333-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.665581-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.665606-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.665693-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.665746-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.667978-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.668127-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.668349-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.668391-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.668992-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.669173-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.669528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.669565-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.669661-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.670020-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.670056-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.670162-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.670222-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.670376-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.670464-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.670610-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.670701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.670826-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.671318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.671572-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.672147-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.672586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.673063-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.673470-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.673624-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.673963-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.674139-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.674510-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.674650-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.675013-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.675170-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.675575-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.676563-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.678252-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.678272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.678414-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.678528-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.678627-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.678750-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.678801-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.678925-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.679054-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.679114-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.679435-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.679673-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.679835-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.679855-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.679986-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.680118-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.680253-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.680285-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.680447-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.680535-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.681032-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.681211-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.681401-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.681416-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.681551-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.681741-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.681865-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.681902-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.682020-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.683077-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.683109-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.683238-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.683526-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.683676-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.683727-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.683868-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.683993-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.684163-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.684226-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.684401-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.685034-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.685193-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.685539-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.685545-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.685688-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.686060-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.686351-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.686670-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.686795-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.687084-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.687136-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.687597-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.687761-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.687979-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.688190-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.688317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.688333-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.688568-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.688620-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.689165-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.689207-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.689313-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.689568-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.689740-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.690609-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.690599-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.691268-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.691350-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.691859-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.691868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.692114-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.692349-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.692537-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.692538-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.692728-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.692884-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.693031-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.693192-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.693231-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.693381-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.693526-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.693819-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.693914-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.693990-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.694108-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.694183-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.694459-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.694504-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.694596-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.694662-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.694720-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.694989-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.695023-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.695441-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.696182-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.696182-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.696363-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.696474-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.696671-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.696706-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.696872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.696991-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.697125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.697176-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.697252-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.697319-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.697436-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.697554-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.697707-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.697714-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.697849-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.697982-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.698395-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.698554-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.698617-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.698669-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.698786-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.699594-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.699765-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.699997-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.700215-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.700449-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.700618-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.700835-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.700875-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.700984-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.701045-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.701782-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.701984-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.702218-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.702338-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.702370-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.702482-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.702650-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.702759-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.702785-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.702884-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.703006-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.703093-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.703253-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.703315-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.703464-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.703571-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.703768-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.703865-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.703922-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.703999-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.704356-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.704526-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.704545-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.704814-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.704845-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.704946-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.705068-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.705142-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.705267-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.705362-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.705501-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.705560-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.705698-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.705780-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.705916-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.705991-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.706031-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.706099-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.706285-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.706437-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.706696-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.706804-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.706943-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.707047-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.707209-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.707278-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.707437-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.707514-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.707653-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.707756-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.707772-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.707952-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.708070-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.708082-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.708220-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.708348-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.708364-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.708494-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.708616-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.708664-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.708820-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.708909-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.709059-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.709160-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.709289-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.709367-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.709511-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.709602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.709625-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.709739-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.709919-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.710053-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.710058-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.710175-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.710216-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.710638-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.710586-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.710797-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.710803-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.711199-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.711224-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.711343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.711452-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.711617-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.711707-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.711764-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.712006-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.712140-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.712162-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.712306-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.712424-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.712445-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.712593-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.712812-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.712881-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.712965-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.713023-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.713130-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.713376-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.713505-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.713536-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.713640-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.713763-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.713860-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.713989-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.714070-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.714219-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.714369-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.714555-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.714746-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.714854-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.714900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.715015-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.715109-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.715326-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.715362-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.715447-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.715481-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.715595-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.715722-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.715848-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.715867-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.715997-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.716130-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.716272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.716276-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.716429-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.716540-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.716548-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.716792-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.716919-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.717231-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.716814-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.717372-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.717505-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.717525-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.717653-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.717820-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.717962-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.717979-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.718113-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.718400-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.718549-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.718658-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.718663-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.718806-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.718920-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.719082-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.719223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.719352-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.719439-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.719575-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.719702-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.719774-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.719953-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.720012-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.720159-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.720273-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.720402-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.720462-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.720606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.720681-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.720719-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.720814-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.721097-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.721262-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.721575-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.721724-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.721841-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.720995-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.722141-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.722193-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.722270-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.722322-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.722393-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.722894-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.722959-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.723068-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.723095-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.723354-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.723376-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.723480-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.723484-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.723841-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.724037-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.724103-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.724236-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.724251-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.724358-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.724644-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.724709-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.724805-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.724864-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.725117-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.725167-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.725239-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.725315-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.725436-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.725536-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.725667-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.725720-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.725855-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.725965-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.726125-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.726166-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.726435-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.726526-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.726592-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.726660-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.726766-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.726881-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.727015-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.727119-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.727122-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.727320-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.727387-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.727443-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.727505-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.727618-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.727821-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.727885-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.727967-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.728015-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.728233-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.728270-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.728373-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.728396-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.728476-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.728492-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.728727-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.728727-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.728858-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.728931-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.728976-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.729044-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.729260-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.729300-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.729408-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.729424-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.729671-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.729671-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.729825-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.729928-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.729928-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.730089-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.730215-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.730349-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.730350-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.730477-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.730489-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.730596-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.731055-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.731062-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.731173-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.731224-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.731357-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.731591-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.731770-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.732105-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.732243-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.732528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.732566-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.732660-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.732722-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.732942-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.733083-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.734060-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.734088-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.734206-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.734318-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.734394-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.734864-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.735042-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.735033-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.735394-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.735467-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.735541-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.735646-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.735686-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.736119-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.736134-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.736255-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.736287-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.736358-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.736426-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.736681-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.736825-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.736829-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.736973-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.737102-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.737135-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.737276-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.737394-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.737520-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.737674-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.737684-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.737811-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.737934-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.737983-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.738126-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.738238-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.738246-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.738399-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.738665-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.738667-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.738763-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.738802-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.738831-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.738929-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.739129-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.739238-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.739259-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.739379-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.739387-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.739675-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.739681-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.739819-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.739830-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.739945-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.740230-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.740673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.740732-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.740816-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.740845-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.741130-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.741122-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.741305-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.741363-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.741616-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.741631-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.741734-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.741842-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.742014-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.742142-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.742144-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.742345-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.742445-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.742593-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.742635-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.742759-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.742863-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.742996-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.743040-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.743099-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.743241-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.743406-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.743545-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.743599-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.743726-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.743827-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.743968-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.744024-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.744163-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.744246-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.744393-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.744476-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.744514-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.744627-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.744798-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.744891-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.744932-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.744973-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.745059-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.745145-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.745224-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.745362-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.745533-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.745727-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.745825-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.745876-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.745970-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.746085-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.746191-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.746310-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.746366-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.746500-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.746628-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.746752-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.746886-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.746977-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.747200-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.747128-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.747363-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.747514-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.747790-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.747900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.747929-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.748028-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.748224-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.748317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.748361-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.748441-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.748486-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.748711-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.748790-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.748852-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.749078-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.749386-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.749495-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.749758-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.749917-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.750168-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.750176-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.750297-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.750314-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.750586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.750602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.750806-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.750955-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.751250-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.751594-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.751760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.751887-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.751960-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.752089-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.752144-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.752281-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.752396-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.753051-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.753088-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.753227-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.753808-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.753835-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.753962-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.753992-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.754100-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	15:21:43.754240-0500	RedLemon	   OUTPUT[0]: Frankenstein.2025.2160p.NF.WEB-DL.HDR.MULTi.DDP5.1.Atmos.H265-BEN.THE.MEN
👤 542 💾 36.27 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇷🇺 / 🇮🇹 / 🇵🇹 / 🇪🇸 / 🇫🇷 / 🇩🇪 / 🇮🇳 / 🇵🇱 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	15:21:43.754291-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.754359-0500	RedLemon	   OUTPUT[1]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:21:43.754585-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.754909-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.755059-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.755178-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.755810-0500	RedLemon	   OUTPUT[2]: Frankenstein.2025.2160p.NF.WEB-DL.DV.P5.ENG.LATINO.DDP5.1.Atmos.MP4.H265-BTM
👤 109 💾 22.86 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio | Subtitles: 3
default	15:21:43.756119-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.755975-0500	RedLemon	   OUTPUT[3]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	15:21:43.756315-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.756390-0500	RedLemon	   OUTPUT[4]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:21:43.756453-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.756520-0500	RedLemon	   OUTPUT[5]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	15:21:43.756766-0500	RedLemon	   OUTPUT[6]: Frankenstein (2025) [MULTi] [2160p] [NF] [WEB-DL] [HDR] [H265] [DDP5.1.Atmos-K83] [Lektor PL i Napisy PL]
👤 18 💾 21.81 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 2160p | torrentio | Subtitles: 3
default	15:21:43.756810-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.756896-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	15:21:43.756968-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.757015-0500	RedLemon	   OUTPUT[8]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	15:21:43.757129-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	15:21:43.757266-0500	RedLemon	   OUTPUT[10]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	15:21:43.757277-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.757400-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.757683-0500	RedLemon	   OUTPUT[11]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:21:43.757694-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.757808-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	15:21:43.757831-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.757915-0500	RedLemon	   OUTPUT[13]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.DV.H.265-SNAKE
👤 35 💾 3 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.758018-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.758122-0500	RedLemon	   OUTPUT[15]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.HDR.H.265-SNAKE
👤 12 💾 4.19 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.758133-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.758419-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.758716-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.758822-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.759089-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.759154-0500	RedLemon	   OUTPUT[16]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	15:21:43.759291-0500	RedLemon	   OUTPUT[17]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.759418-0500	RedLemon	   OUTPUT[18]: Frankenstein.2025.1080p.WEB.h264-ETHEL
👤 175 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.759545-0500	RedLemon	   OUTPUT[19]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:21:43.759834-0500	RedLemon	   OUTPUT[20]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:21:43.760101-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.760468-0500	RedLemon	   OUTPUT[21]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.760561-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.760926-0500	RedLemon	   OUTPUT[22]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.761029-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.761066-0500	RedLemon	   OUTPUT[23]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.761116-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.761197-0500	RedLemon	   OUTPUT[24]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
👤 122 💾 5.98 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:43.761333-0500	RedLemon	   OUTPUT[25]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:43.761343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.761456-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	15:21:43.761634-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.761672-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.81 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	15:21:43.761801-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:21:43.761930-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.762130-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.762201-0500	RedLemon	   OUTPUT[30]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:43.762290-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.762326-0500	RedLemon	   OUTPUT[31]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.762456-0500	RedLemon	   OUTPUT[32]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.762581-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.762592-0500	RedLemon	   OUTPUT[33]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.762733-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.762844-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.762818-0500	RedLemon	   OUTPUT[34]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:21:43.762996-0500	RedLemon	   OUTPUT[35]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:43.763124-0500	RedLemon	   OUTPUT[36]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	15:21:43.763123-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.763262-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.763380-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.763382-0500	RedLemon	   OUTPUT[37]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:21:43.763535-0500	RedLemon	   OUTPUT[38]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.763669-0500	RedLemon	   OUTPUT[39]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:43.763681-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.763802-0500	RedLemon	   OUTPUT[40]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.763809-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.763926-0500	RedLemon	   OUTPUT[41]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.764045-0500	RedLemon	   OUTPUT[42]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:43.764143-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.764183-0500	RedLemon	   OUTPUT[43]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:43.764276-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.764311-0500	RedLemon	   OUTPUT[44]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:43.764435-0500	RedLemon	   OUTPUT[45]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:21:43.764568-0500	RedLemon	   OUTPUT[46]: Frankenstein (2025) [MULTi] [1080p] [NF] [WEB-DL] [H264] [DDP5.1.Atmos-K83[ [Lektor PL i Napisy PL]
👤 9 💾 6.66 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 1080p | torrentio | Subtitles: 3
default	15:21:43.764539-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.765145-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.765301-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.765430-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.765892-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.766068-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.767086-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.767277-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.767606-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.767673-0500	RedLemon	   OUTPUT[47]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:21:43.767745-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.767816-0500	RedLemon	   OUTPUT[48]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.767860-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.767937-0500	RedLemon	   OUTPUT[49]: Frankenstein.2025.WEB-DL.1080p-Dual-Lat
👤 7 💾 6.8 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:21:43.768055-0500	RedLemon	   OUTPUT[50]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:43.768157-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.768177-0500	RedLemon	   OUTPUT[51]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.768291-0500	RedLemon	   OUTPUT[52]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.768296-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.768539-0500	RedLemon	   OUTPUT[53]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.768575-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.768671-0500	RedLemon	   OUTPUT[54]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.768706-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.768796-0500	RedLemon	   OUTPUT[55]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:43.768805-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.768951-0500	RedLemon	   OUTPUT[56]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.769090-0500	RedLemon	   OUTPUT[57]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:43.769136-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.769216-0500	RedLemon	   OUTPUT[58]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:43.769258-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.769342-0500	RedLemon	   OUTPUT[59]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	15:21:43.769368-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.769603-0500	RedLemon	   OUTPUT[60]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	15:21:43.769680-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.769727-0500	RedLemon	   OUTPUT[61]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	15:21:43.769834-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.769840-0500	RedLemon	   OUTPUT[62]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:43.769967-0500	RedLemon	   OUTPUT[63]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:21:43.770090-0500	RedLemon	   OUTPUT[64]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:43.770181-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.770214-0500	RedLemon	   OUTPUT[65]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	15:21:43.770338-0500	RedLemon	   OUTPUT[66]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:21:43.770334-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.770453-0500	RedLemon	   OUTPUT[67]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:43.770453-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.770572-0500	RedLemon	   OUTPUT[68]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	15:21:43.770684-0500	RedLemon	   OUTPUT[69]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:43.770731-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.770864-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.770946-0500	RedLemon	   OUTPUT[70]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:21:43.770988-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.771083-0500	RedLemon	   OUTPUT[71]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:43.771215-0500	RedLemon	   OUTPUT[72]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:43.771291-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.771321-0500	RedLemon	   OUTPUT[73]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:43.771395-0500	RedLemon	   OUTPUT[74]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:43.771441-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.771569-0500	RedLemon	   OUTPUT[75]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	15:21:43.771708-0500	RedLemon	   OUTPUT[76]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:43.771750-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.771826-0500	RedLemon	   OUTPUT[77]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	15:21:43.771893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.771943-0500	RedLemon	   OUTPUT[78]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	15:21:43.772006-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.772109-0500	RedLemon	   OUTPUT[79]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.772258-0500	RedLemon	   OUTPUT[80]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.772289-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.772406-0500	RedLemon	   OUTPUT[81]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.772419-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.772547-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.772557-0500	RedLemon	   OUTPUT[82]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.773075-0500	RedLemon	   OUTPUT[83]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.773160-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.773283-0500	RedLemon	   OUTPUT[84]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.773330-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.773442-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:21:43.773642-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.773792-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.773905-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.774209-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.774346-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.774472-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.774823-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.775002-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.775298-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.775434-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.775547-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.775842-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.775976-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.773597-0500	RedLemon	   OUTPUT[86]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.776176-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.776452-0500	RedLemon	   OUTPUT[87]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.776523-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.776623-0500	RedLemon	   OUTPUT[88]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.776679-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.776781-0500	RedLemon	   OUTPUT[89]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.776937-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.776981-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.777054-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.777123-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.777143-0500	RedLemon	   OUTPUT[92]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:21:43.777229-0500	RedLemon	   OUTPUT[93]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.777240-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.777312-0500	RedLemon	   OUTPUT[94]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	15:21:43.777622-0500	RedLemon	   OUTPUT[95]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.777647-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.777774-0500	RedLemon	   OUTPUT[96]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.777785-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.777911-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.777915-0500	RedLemon	   OUTPUT[97]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	15:21:43.778064-0500	RedLemon	   OUTPUT[98]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:21:43.778208-0500	RedLemon	   OUTPUT[99]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	15:21:43.778223-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.778352-0500	RedLemon	   OUTPUT[100]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.778378-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.778493-0500	RedLemon	   OUTPUT[101]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.778795-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.778955-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.779077-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.779505-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.778639-0500	RedLemon	   OUTPUT[102]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	15:21:43.779659-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.779789-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.779774-0500	RedLemon	   OUTPUT[103]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:21:43.780153-0500	RedLemon	   OUTPUT[104]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.780231-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.780332-0500	RedLemon	   OUTPUT[105]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	15:21:43.780394-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.780488-0500	RedLemon	   OUTPUT[106]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.780637-0500	RedLemon	   OUTPUT[107]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	15:21:43.780790-0500	RedLemon	   OUTPUT[108]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	15:21:43.780810-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.780957-0500	RedLemon	   OUTPUT[109]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.849000-0500	RedLemon	   OUTPUT[110]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.849112-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.849250-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.849556-0500	RedLemon	   OUTPUT[111]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	15:21:43.849693-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.849720-0500	RedLemon	   OUTPUT[112]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	15:21:43.849821-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.852514-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.853080-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.859967-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.860380-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.860533-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.861406-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.861778-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.850433-0500	RedLemon	   OUTPUT[113]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.861921-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.872104-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.875361-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.862124-0500	RedLemon	   OUTPUT[114]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.878166-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.878206-0500	RedLemon	   OUTPUT[115]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.878372-0500	RedLemon	   OUTPUT[116]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:21:43.878534-0500	RedLemon	   OUTPUT[117]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.886060-0500	RedLemon	   OUTPUT[118]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:43.887258-0500	RedLemon	   OUTPUT[119]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.878645-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.887499-0500	RedLemon	   OUTPUT[120]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.890280-0500	RedLemon	   OUTPUT[121]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.890494-0500	RedLemon	   OUTPUT[122]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.891097-0500	RedLemon	   OUTPUT[123]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	15:21:43.891299-0500	RedLemon	   OUTPUT[124]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:43.891493-0500	RedLemon	   OUTPUT[125]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	15:21:43.891647-0500	RedLemon	   OUTPUT[126]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.892072-0500	RedLemon	   OUTPUT[127]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.892239-0500	RedLemon	   OUTPUT[128]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.892395-0500	RedLemon	   OUTPUT[129]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	15:21:43.892545-0500	RedLemon	   OUTPUT[130]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	15:21:43.892699-0500	RedLemon	   OUTPUT[131]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	15:21:43.888397-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.892848-0500	RedLemon	   OUTPUT[132]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	15:21:43.904874-0500	RedLemon	   OUTPUT[133]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.905133-0500	RedLemon	   OUTPUT[134]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.892999-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.905334-0500	RedLemon	   OUTPUT[135]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:43.905497-0500	RedLemon	   OUTPUT[136]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.905651-0500	RedLemon	   OUTPUT[137]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.908910-0500	RedLemon	   OUTPUT[138]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:43.909077-0500	RedLemon	   OUTPUT[139]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.909224-0500	RedLemon	   OUTPUT[140]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.909446-0500	RedLemon	   OUTPUT[141]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	15:21:43.909596-0500	RedLemon	   OUTPUT[142]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	15:21:43.910187-0500	RedLemon	   OUTPUT[143]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.910356-0500	RedLemon	   OUTPUT[144]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.910839-0500	RedLemon	   OUTPUT[145]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	15:21:43.911111-0500	RedLemon	   OUTPUT[146]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	15:21:43.911276-0500	RedLemon	   OUTPUT[147]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	15:21:43.911429-0500	RedLemon	   OUTPUT[148]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	15:21:43.911596-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.905695-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.911715-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.913181-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.913305-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.913418-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.913525-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.911895-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.928361-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.922463-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.929486-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.929568-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.929663-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.929677-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.930010-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.930155-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.930268-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.930556-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.931011-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.931297-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.931655-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.931827-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.932240-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.932408-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.932528-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.937439-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.937747-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.938127-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.942611-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.943139-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.943353-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.943685-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.944031-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.944197-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.944519-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.944664-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.945009-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.954534-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.954946-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.955091-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.955718-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.958049-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.958712-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.958592-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.958959-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.959084-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.959394-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:43.959537-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.959662-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.964567-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.964600-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.968115-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.969280-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.970385-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.970392-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.971100-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.971590-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.971642-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.971790-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.971975-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.972138-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.972320-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.972443-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.971782-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.974034-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.974034-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.974479-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.974623-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:43.974844-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.974998-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.975416-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.975824-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.976151-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.976289-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.976403-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.976722-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.976969-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.977108-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.977628-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.977701-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.977833-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.978275-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.978410-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.978580-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.978915-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.979077-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.979412-0500	runningboardd	Invalidating assertion 174-4026-781 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:43.979358-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.979371-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.979492-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.979604-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.979964-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.980381-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.980424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.980521-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.980633-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.980554-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.981143-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.981525-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.981826-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.982335-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.982484-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:43.982599-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:21:43.982702-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:21:43.983376-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.983572-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:21:43.983877-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	15:21:43.984217-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:43.984489-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:43.984266-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.985121-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:43.985357-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.985487-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:43.985853-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:43.986323-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.986903-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.987056-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.988400-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.988922-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.989939-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.990137-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.990989-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.991440-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.991956-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.992316-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.992942-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:43.993185-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:43.994311-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:43.994474-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:43.995462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:43.995871-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:43.998352-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:43.998584-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.000168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.001164-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.001323-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.002094-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.004730-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.005276-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.006136-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.007293-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.007483-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.008213-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.008479-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.008760-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.009397-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.009743-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.010879-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.011071-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.011542-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.011770-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.012216-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.012640-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.012782-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.013180-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.013859-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.014092-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.014875-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.015080-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.015522-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.015727-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.016699-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.017379-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.017626-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.018268-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.018652-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.019819-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.021972-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.022171-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.023555-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.024471-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.024775-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.025444-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.025892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.026055-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.026417-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.026820-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.027208-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.027829-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.028603-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.028865-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.029191-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.030051-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.030385-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.030668-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.031574-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.032049-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.036417-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.040026-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.040210-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.041743-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.041949-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.042098-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.042610-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.043050-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.043565-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.043775-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.044044-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.044601-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.045104-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.046755-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.046977-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.048374-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.049137-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.049297-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.050323-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.051021-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.051959-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.052593-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.053128-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.053572-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.054383-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.054893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.055345-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.056509-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.057215-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.057725-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.058468-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.058712-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.059725-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.059956-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.060946-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.061472-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.066303-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.068576-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.069160-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.069674-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.072554-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.073844-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.074737-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.075299-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.076070-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.076811-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.077181-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.077768-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.077934-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.078043-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.078320-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.078459-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.078586-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.086893-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.087100-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.094216-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.096688-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.096884-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.097208-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.097368-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.097712-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.100471-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.110913-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.111107-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.111227-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.111530-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.111696-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.112031-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.120309-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.120743-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.120929-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.121082-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.121481-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.121623-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.124568-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.124984-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.125154-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.125510-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.125679-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.140633-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.140825-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.140974-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.141439-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.142050-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.142872-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.145332-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.145489-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.145855-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.146038-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.146188-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.146563-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.146752-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.147144-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.147344-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.147459-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.148001-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.149425-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.149991-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.150204-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.150854-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.151376-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.152034-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.152445-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.152821-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.153513-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.154287-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.155023-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.155719-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.156146-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.156405-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.156902-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.157285-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.157527-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.158029-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.158333-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.159013-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.159257-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.159615-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.160456-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.160736-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.160996-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.161411-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.161633-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.161808-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.162323-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.162533-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.162667-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.163125-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.163341-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.163765-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.164000-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.164186-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.165113-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.166399-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.167768-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.167931-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.168299-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.168756-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.169136-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.169325-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.170032-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.170305-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.170603-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.171237-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.171482-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.171710-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.172290-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.172720-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.172982-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.173701-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.173904-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.174043-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.174382-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.174604-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.175081-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.175281-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.175803-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.176032-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.176480-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.176664-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.176826-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.177252-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.177510-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.177692-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.178469-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.178771-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.179277-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.179591-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.179774-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.180233-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.180612-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.180844-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.181387-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.181592-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.181730-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.182075-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.182251-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.182403-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.182796-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.182988-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.183552-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.183805-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.184055-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.185034-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.185286-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.185666-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.188239-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.188662-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.189908-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.190654-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.190923-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.191483-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.191692-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.191869-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.192270-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.192502-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.192682-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.193166-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.193347-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.193481-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.193917-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.194113-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.194509-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.194719-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.194901-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.195276-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.195986-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.196131-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.196491-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.196681-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.197042-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.197230-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.197738-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.197966-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.198132-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.198587-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.198781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.198946-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.199383-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.199708-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.200438-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.200872-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.201159-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.202531-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.202712-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.202873-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.203516-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.203738-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.204212-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.204463-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.204910-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.205108-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.205492-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.206176-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.206384-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.207447-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.207670-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.208781-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.209703-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.209894-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.210041-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.210987-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.211230-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.211409-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.211996-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.212119-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.212197-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.212618-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.213028-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.213494-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.213713-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.214844-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.215425-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.215617-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.216146-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.216351-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.216512-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.217372-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.217605-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.217756-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.218224-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.218343-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.218744-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.218902-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.222222-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.222434-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.224472-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.232738-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.232948-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.233752-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.234491-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.234707-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.235812-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.236514-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.238888-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.239207-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.240545-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.240781-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.241101-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.241544-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.241692-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.242050-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.242413-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.242578-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.243247-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:44.243299-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:44.243350-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:44.245414-0500	runningboardd	Invalidating assertion 174-114-780 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:44.246439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.246567-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.246854-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.247080-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.247191-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.247289-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.248115-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.248629-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.248785-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.249350-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.249501-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.249609-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.249854-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.250060-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.251218-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.251633-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.251836-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.252250-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.252387-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.252732-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.255214-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.258049-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.258686-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.258836-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.259278-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.259430-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.259793-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.261111-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.261358-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.262145-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.262320-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.262715-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.263072-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.264141-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.265186-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.265538-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.265661-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.266163-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.267029-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.267385-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.267885-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.268088-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.268220-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.268544-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.268699-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.268835-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.269154-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.270412-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.270853-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.271027-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.271148-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.271475-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.271621-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.271750-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.272082-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.272448-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.273348-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.273829-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.274003-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.274410-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.274666-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.275804-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.276303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.276473-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.276864-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.277024-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.277555-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.278002-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.278677-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.279172-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.279412-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.279794-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.280417-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.280891-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.281419-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.281954-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.282202-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.282371-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.282895-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.286964-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.287635-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.288108-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.288321-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.289016-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.290059-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.290551-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.290712-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.291073-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.291282-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.291446-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.291912-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.293620-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.294431-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.294578-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.294998-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:21:44.295253-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:21:44.295416-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.296420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.296586-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.296928-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.297075-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.297805-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.298048-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.298439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.298588-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.298916-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.299062-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.299392-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.299575-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.301342-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.301528-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.301897-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.302052-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.302416-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.302608-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.302983-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.303777-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.304866-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.305116-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.306442-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.306649-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.307817-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.308001-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.308598-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.308728-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.308949-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.309066-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.309281-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.309365-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.309555-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.310781-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.311255-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.311460-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.312042-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.312197-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.313288-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.313724-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.314794-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.453068-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.453515-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.453658-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.458861-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.459053-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.460798-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.461014-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.461365-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.461491-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.461766-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.461889-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.462174-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.471607-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.473526-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.473706-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.474456-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.474623-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.476028-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.476198-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.476439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.476528-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.476711-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.476794-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.476972-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.479392-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.479821-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.479962-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.480268-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.480408-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.480712-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.480868-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.482577-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.482731-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.483053-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.483196-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.483516-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.484086-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.484484-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.484884-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.485279-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.485445-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.485802-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.485996-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.486373-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.486530-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.487401-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.487571-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.487860-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.488017-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.488360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.488575-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.488876-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.489001-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.489399-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.489893-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.490427-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.490576-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.490869-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.491010-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.491303-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.491493-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.492105-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.492247-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.492553-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.492691-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.493633-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.493860-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.494252-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.494395-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.495079-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.495254-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.495615-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.495812-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.496469-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.496633-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.496943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.497087-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.497405-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.497582-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.497935-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.498064-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.498366-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.498502-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.500006-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.500288-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.501324-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.501463-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.501743-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.501889-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.502171-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.502326-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.502908-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.503067-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.503372-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.503505-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.504036-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.504228-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.504569-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.504707-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.505705-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.505892-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.506258-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.506444-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.507132-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.507373-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.507894-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.508052-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.508372-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.508537-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.508953-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.509093-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.509378-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.509505-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.509783-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.509936-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.510240-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.510411-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.510852-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.511014-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.511348-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.511511-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.511825-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.511965-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.512084-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.512371-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.512500-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.512620-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.512921-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.513533-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.514333-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.514528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.514887-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.515252-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.515464-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.515585-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.515892-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.516037-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.516319-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.516448-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.516550-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.517229-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.517396-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.517539-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.517898-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.518115-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.518491-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.519433-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.519534-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.519785-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.519979-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.520111-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.520749-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.520936-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.521250-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.521404-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.521816-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.522052-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.522141-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.522221-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.522413-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.522516-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.523283-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.524261-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.524477-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.525110-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.525286-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.525429-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.526041-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.526343-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.526858-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.527034-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.527329-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.527714-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.527869-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.528004-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.528328-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.528573-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.529134-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.529318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.529450-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.529771-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.530488-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.530749-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.531409-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.531625-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.532284-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.532464-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.532589-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.532927-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.533090-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.533854-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.534442-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.534648-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.535641-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.535830-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.536309-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.536751-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.536916-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.537050-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.537375-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.537681-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.538166-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.538352-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.538635-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.538983-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.539999-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:44.539205-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.540046-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:44.539347-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.540093-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:44.539690-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.539855-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.540172-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.540930-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.541063-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.542165-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.542329-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.542467-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.542937-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.543128-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.543555-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.543724-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.543848-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.544265-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.544426-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.544730-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.545295-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.545490-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.545803-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.546246-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.546492-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.546917-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.547082-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.547214-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.547566-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.550554-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.550941-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.551093-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.551202-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.552077-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.552400-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.552562-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.553751-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.553946-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.554275-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.554425-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.554543-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.555216-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.555380-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.555505-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.555805-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.556557-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.557260-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.557456-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.557888-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.558171-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.558275-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.558361-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.558557-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.559010-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.559246-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.559341-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.559412-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.559581-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.559664-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.559737-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.559909-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.560000-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.560173-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.560257-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.561122-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.561480-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.561640-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.561808-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.562793-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.562983-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.563302-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.563455-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.563571-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.564244-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.564647-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.564806-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.565148-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.565311-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.565618-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.566289-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.566445-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.566823-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.566998-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.567148-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.569122-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.569447-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.571037-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.571320-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.571451-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.572171-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.572357-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.572590-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.573750-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.574230-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.574474-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.574574-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.574651-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.574831-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.574914-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.576273-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.576682-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.576868-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.584299-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.584487-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.584600-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.584882-0500	RedLemon	    📺 Resolution match: 1080p
default	15:21:44.585006-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.585119-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.585395-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.619035-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.619476-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.619631-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.620034-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.620237-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.620548-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.620716-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.626880-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.627038-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.627343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.627495-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.628629-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.628845-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.629223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.629368-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.629654-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.629781-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.630134-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.630372-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.631488-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.631669-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.632230-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.632917-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.633344-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.633563-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.635797-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.635986-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.638176-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.638370-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.638673-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.638827-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.639127-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.639242-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.639508-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.673044-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.673393-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.673547-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.674056-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.674228-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.674606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.674823-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.677361-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.677598-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.678271-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:21:44.678456-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:44.678946-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:21:44.680520-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:21:44.681301-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:21:44.681523-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:21:44.681663-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	15:21:44.681852-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.682027-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	15:21:44.682192-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.682344-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.682506-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.682933-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.683263-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.683728-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.683934-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.684125-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.684305-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.684494-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:21:44.684674-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.684855-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.685035-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.689714-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	15:21:44.690527-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.690711-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.690856-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.691000-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.691142-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.691313-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:21:44.691473-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.692836-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	15:21:44.693536-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.693929-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	15:21:44.694318-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.694536-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.694847-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.695033-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	15:21:44.695628-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:21:44.696089-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	15:21:44.697277-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.697561-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.697982-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	15:21:44.698580-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:21:44.699256-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.699512-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	15:21:44.700609-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.700819-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	15:21:44.700975-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	15:21:44.701132-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.701278-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.701847-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	15:21:44.702069-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	15:21:44.703340-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.703555-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.703720-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.704430-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:21:44.704633-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.704783-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:44.704927-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.705066-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.705199-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.705336-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.705856-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	15:21:44.706073-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:44.706233-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	15:21:44.706398-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.707988-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.708479-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.708676-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	15:21:44.709064-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	15:21:44.710800-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	15:21:44.711203-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	15:21:44.711405-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.711555-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.711693-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:44.711831-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.711966-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.712100-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:21:44.713910-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.714087-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.714237-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	15:21:44.714850-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	15:21:44.715194-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.715748-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.716959-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	15:21:44.717081-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	15:21:44.717190-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	15:21:44.717297-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	15:21:44.717391-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:21:44.717480-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	15:21:44.717830-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:21:44.717982-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	15:21:44.718106-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	15:21:44.718230-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	15:21:44.718347-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	15:21:44.718482-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	15:21:44.718615-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:21:44.718739-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	15:21:44.718863-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.718997-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	15:21:44.719120-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.719253-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:21:44.719383-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:21:44.719515-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.719667-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.719789-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.719919-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:44.721609-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	15:21:44.721765-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:21:44.721903-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.722033-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:44.722305-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.722465-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.723572-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.724293-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:21:44.724441-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:44.724575-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	15:21:44.724713-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:21:44.724848-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.724980-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:44.726170-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.726320-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:44.726458-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:44.727546-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:44.727684-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:21:44.727802-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:21:44.727926-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.728045-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:21:44.728163-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.729466-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.729619-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.729754-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.729896-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:21:44.730017-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.730154-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:21:44.730588-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:44.730730-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	15:21:44.731085-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	15:21:44.731262-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	15:21:44.731414-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:44.731554-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:21:44.731676-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:44.733130-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	15:21:44.733552-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:21:44.733720-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:21:44.734078-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	15:21:44.734560-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:21:44.734724-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:21:44.734865-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:44.735018-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:44.735261-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:44.735723-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:44.735863-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	15:21:44.735984-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:21:44.736098-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	15:21:44.736216-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	15:21:44.736316-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.736413-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.737610-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.738389-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.738519-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.738806-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.739063-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.739805-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.739955-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.740075-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.740511-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.740986-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.741144-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.741264-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.741373-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.741482-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.741588-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.741689-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.742022-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.742151-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.743175-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.743499-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.743902-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.744350-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.744877-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.746776-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:21:44.746946-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.747945-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.748075-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.748178-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.748277-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.748374-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.749308-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.749650-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.749788-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.749902-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.750312-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.750655-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.751043-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.751189-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.751316-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.751429-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.751538-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.751645-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.751933-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.752418-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.752545-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.752933-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.753770-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.753925-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:21:44.754442-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:21:44.754738-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:21:44.754877-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:21:44.755017-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	15:21:44.755315-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:44.755450-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:44.755558-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:44.755657-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:21:44.905281-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> received response, status 200 content K
default	15:21:44.906308-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> response ended
default	15:21:44.906383-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> done using Connection 9
default	15:21:44.906512-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> summary for task success {transaction_duration_ms=2681, response_status=200, connection=9, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=2679, response_duration_ms=1, request_bytes=277, response_bytes=20492, cache_hit=false}
default	15:21:44.906800-0500	RedLemon	Task <C0028399-7D20-43F6-9FE7-E9F27D4FEEF2>.<12> finished successfully
default	15:21:44.913031-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:44.913645-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2D28F82B-FECD-43FE-A4AC-3DE13B3A6D45] (reporting strategy default)> on Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> was not selected for reporting
default	15:21:44.915327-0500	RedLemon	Connection 48: starting, TC(0x0)
default	15:21:44.915397-0500	RedLemon	[C48 C4734714-6356-4562-BDB2-941F7DE28C25 127.0.0.1:47253 tcp, url hash: 8f4f1011, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{BB95AF92-846A-4B9C-AA4E-FAA954B8F9E9}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:44.915492-0500	RedLemon	[C48 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	15:21:44.915632-0500	RedLemon	[C48 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: D21592DE-4F27-4972-BD50-76F74281122A
default	15:21:44.916199-0500	RedLemon	[C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.000s
default	15:21:44.916240-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state preparing
default	15:21:44.916584-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> setting up Connection 48
default	15:21:44.917061-0500	RedLemon	nw_socket_handle_socket_event [C48:2] Socket received CONNECTED event
default	15:21:44.917265-0500	RedLemon	nw_flow_connected [C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	15:21:44.917330-0500	RedLemon	[C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.001s
default	15:21:44.917404-0500	RedLemon	nw_flow_connected [C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:44.917661-0500	RedLemon	[C48 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	15:21:44.917810-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state ready
default	15:21:44.917866-0500	RedLemon	[C48 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.002s
default	15:21:44.917952-0500	RedLemon	Connection 48: connected successfully
default	15:21:44.918041-0500	RedLemon	Connection 48: ready C(N) E(N)
default	15:21:44.918339-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> now using Connection 48
default	15:21:44.918545-0500	RedLemon	Connection 48: received viability advisory(Y)
default	15:21:44.920114-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> sent request, body S 90
default	15:21:44.921456-0500	RedLemon	🔓 Unlock request: infoHash=50a4c9c42abe..., fileIdx=0
default	15:21:44.921614-0500	RedLemon	✅ Token found, attempting unlock...
default	15:21:44.921957-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:44.922461-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2126E5E0-C0D6-42B8-AC2C-EE6221D03B6A] (reporting strategy default)> on Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> was not selected for reporting
default	15:21:44.923645-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:44.924000-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:21:44.924432-0500	RedLemon	Connection 49: enabling TLS
default	15:21:44.924473-0500	RedLemon	Connection 49: starting, TC(0x0)
default	15:21:44.924526-0500	RedLemon	[C49 3B35D7BA-1A9A-4E38-A86E-A4BDE0821169 Hostname#13203cde:443 quic-connection, url hash: 9d73bcd8, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{BB95AF92-846A-4B9C-AA4E-FAA954B8F9E9}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:44.924618-0500	RedLemon	[C49 Hostname#13203cde:443 initial path ((null))] event: path:start @0.000s
default	15:21:44.924977-0500	RedLemon	[C49 Hostname#13203cde:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: BEA9EA81-7DD2-4164-A764-779F49D42D5F
default	15:21:44.925167-0500	RedLemon	[C49 Hostname#13203cde:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:21:44.925208-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state preparing
default	15:21:44.925508-0500	RedLemon	[C49.1 Hostname#13203cde:443 initial path ((null))] event: path:start @0.000s
default	15:21:44.925880-0500	RedLemon	[C49.1 Hostname#13203cde:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 376E01BF-A619-49D2-B734-2154B4289747
default	15:21:44.926103-0500	RedLemon	[C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	15:21:44.926282-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> setting up Connection 49
default	15:21:44.926470-0500	mDNSResponder	[R957] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'YvUIV3orAzkBrkkk9tx76w=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:44.960903-0500	RedLemon	nw_endpoint_resolver_update [C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#314b8c2e:443
default	15:21:44.961035-0500	RedLemon	nw_endpoint_resolver_update [C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#0f22cb18:443
default	15:21:44.964096-0500	RedLemon	nw_endpoint_resolver_update [C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#201e0c84.443
default	15:21:44.964270-0500	RedLemon	nw_endpoint_resolver_update [C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#333d5228.443
default	15:21:44.964498-0500	RedLemon	[C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.039s
default	15:21:44.964775-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 initial path ((null))] event: path:start @0.040s
default	15:21:44.971599-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.046s, uuid: 9BBFBF68-A907-4355-8F46-DB62120E1B72
default	15:21:44.971882-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.047s
default	15:21:44.981591-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.056s
default	15:21:44.983002-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.058s
default	15:21:44.983247-0500	RedLemon	tcp_output [C49.1.1:3] flags=[S] seq=4260418052, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=4260418052
default	15:21:44.988010-0500	RedLemon	nw_endpoint_resolver_update [C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#0f22cb18:443
default	15:21:44.988193-0500	RedLemon	nw_endpoint_resolver_update [C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#201e0c84.443
default	15:21:44.988370-0500	RedLemon	nw_endpoint_resolver_update [C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#333d5228.443
default	15:21:44.988590-0500	RedLemon	[C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.064s
default	15:21:45.109544-0500	RedLemon	tcp_input [C49.1.1:3] flags=[S.] seq=1363374234, ack=4260418053, win=64240 state=SYN_SENT rcv_nxt=0, snd_una=4260418052
default	15:21:45.109720-0500	RedLemon	nw_flow_connected [C49.1.1 IPv4#314b8c2e:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:45.109976-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.185s
default	15:21:45.110117-0500	RedLemon	[C49.1 Hostname#13203cde:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.185s
default	15:21:45.110568-0500	RedLemon	[C49 Hostname#13203cde:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.185s
default	15:21:45.111313-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C49.1.1:2][0x7fa205b7e260] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:45.111644-0500	RedLemon	boringssl_context_info_handler(2028) [C49.1.1:2][0x7fa205b7e260] Client handshake started
default	15:21:45.112049-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS client enter_early_data
default	15:21:45.112545-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS client read_server_hello
default	15:21:45.243911-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:45.244062-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:45.244451-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:45.244859-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:45.245878-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:45.245954-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:45.246980-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C49.1.1:2][0x7fa205b7e260] Performing external trust evaluation
default	15:21:45.247139-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C49.1.1:2][0x7fa205b7e260] Asyncing for external verify block
default	15:21:45.247319-0500	RedLemon	Connection 49: asked to evaluate TLS Trust
default	15:21:45.247767-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> auth completion disp=1 cred=0x0
default	15:21:45.254760-0500	RedLemon	Connection 49: TLS Trust result 0
default	15:21:45.254822-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C49.1.1:2][0x7fa205b7e260] Returning from external verify block with result: true
default	15:21:45.254914-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C49.1.1:2][0x7fa205b7e260] Certificate verification result: OK
default	15:21:45.255211-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:45.255515-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:45.255556-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:45.255594-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:45.255630-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:45.255774-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS 1.3 client done
default	15:21:45.256325-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS client finish_client_handshake
default	15:21:45.256377-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1.1:2][0x7fa205b7e260] Client handshake state: TLS client done
default	15:21:45.256419-0500	RedLemon	boringssl_context_info_handler(2034) [C49.1.1:2][0x7fa205b7e260] Client handshake done
default	15:21:45.257574-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C49.1.1:2][0x7fa205b7e260] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0804) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(146ms) flight_time(133ms) rtt(132ms) write_stalls(0) read_stalls(7)]
default	15:21:45.257941-0500	RedLemon	nw_flow_connected [C49.1.1 IPv4#314b8c2e:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:45.258419-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.333s
default	15:21:45.258585-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state ready
default	15:21:45.258735-0500	RedLemon	[C49.1 Hostname#13203cde:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.334s
default	15:21:45.258800-0500	RedLemon	[C49 Hostname#13203cde:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.334s
default	15:21:45.259018-0500	RedLemon	[C49.1.1 IPv4#314b8c2e:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.334s
default	15:21:45.259171-0500	RedLemon	[C49.1 Hostname#13203cde:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.334s
default	15:21:45.259232-0500	RedLemon	[C49 Hostname#13203cde:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.334s
default	15:21:45.259411-0500	RedLemon	Connection 49: connected successfully
default	15:21:45.259547-0500	RedLemon	Connection 49: TLS handshake complete
default	15:21:45.259838-0500	RedLemon	Connection 49: ready C(N) E(N)
default	15:21:45.260448-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> now using Connection 49
default	15:21:45.260756-0500	RedLemon	Connection 49: received viability advisory(Y)
default	15:21:45.261445-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> sent request, body S 291
default	15:21:45.332946-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> received response, status 200 content K
default	15:21:45.333420-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> response ended
default	15:21:45.333501-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> done using Connection 38
default	15:21:45.333746-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> summary for task success {transaction_duration_ms=2560, response_status=200, connection=38, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=2559, response_duration_ms=0, request_bytes=277, response_bytes=19768, cache_hit=false}
default	15:21:45.334276-0500	RedLemon	Task <E29F47FA-614D-4F3D-95E2-863B4B63A678>.<13> finished successfully
default	15:21:45.341711-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:45.342643-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [16D0B92F-41AD-43E5-A1F0-093325D6B622] (reporting strategy default)> on Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> was not selected for reporting
default	15:21:45.345170-0500	RedLemon	Connection 50: starting, TC(0x0)
default	15:21:45.345246-0500	RedLemon	[C50 0CA9332D-5E12-47EA-9625-29C4EA52A52A 127.0.0.1:47253 tcp, url hash: 8f4f1011, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{BB95AF92-846A-4B9C-AA4E-FAA954B8F9E9}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:45.345343-0500	RedLemon	[C50 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	15:21:45.345491-0500	RedLemon	[C50 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: D21592DE-4F27-4972-BD50-76F74281122A
default	15:21:45.346534-0500	RedLemon	[C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.001s
default	15:21:45.346626-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state preparing
default	15:21:45.346924-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> setting up Connection 50
default	15:21:45.348558-0500	RedLemon	nw_socket_handle_socket_event [C50:2] Socket received CONNECTED event
default	15:21:45.350615-0500	RedLemon	nw_flow_connected [C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	15:21:45.350780-0500	RedLemon	[C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.005s
default	15:21:45.350851-0500	RedLemon	nw_flow_connected [C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:45.351017-0500	RedLemon	[C50 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.005s
default	15:21:45.351903-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state ready
default	15:21:45.352025-0500	RedLemon	[C50 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.006s
default	15:21:45.352106-0500	RedLemon	Connection 50: connected successfully
default	15:21:45.352600-0500	RedLemon	Connection 50: ready C(N) E(N)
default	15:21:45.352925-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> now using Connection 50
default	15:21:45.353123-0500	RedLemon	Connection 50: received viability advisory(Y)
default	15:21:45.355552-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> sent request, body S 90
default	15:21:45.358253-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	15:21:45.358510-0500	RedLemon	✅ Token found, attempting unlock...
default	15:21:45.358869-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:45.359302-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4DFEC0CD-5779-44AE-8B7C-6D2FDA6F9C40] (reporting strategy default)> on Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> was not selected for reporting
default	15:21:45.361113-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:45.361310-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> now using Connection 49
default	15:21:45.361991-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> sent request, body S 291
default	15:21:45.621478-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> received response, status 201 content U
default	15:21:45.621584-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> done using Connection 49
default	15:21:45.621705-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> response ended
default	15:21:45.621820-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> summary for task success {transaction_duration_ms=698, response_status=201, connection=49, protocol="h2", domain_lookup_duration_ms=38, connect_duration_ms=275, secure_connection_duration_ms=146, private_relay=false, request_start_ms=337, request_duration_ms=0, response_start_ms=698, response_duration_ms=0, request_bytes=508, response_bytes=196, cache_hit=false}
default	15:21:45.622006-0500	RedLemon	Task <5292D30D-5DDE-4860-B544-35B53B6C1BA5>.<151> finished successfully
default	15:21:45.622339-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:45.622756-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CC8C3A93-67E4-4AFD-B384-F627DEED8053] (reporting strategy default)> on Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> was not selected for reporting
default	15:21:45.623930-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:45.624310-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> now using Connection 49
default	15:21:45.624820-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> sent request, body N 0
default	15:21:45.643045-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> received response, status 201 content U
default	15:21:45.643220-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> done using Connection 49
default	15:21:45.643635-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> response ended
default	15:21:45.643857-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> summary for task success {transaction_duration_ms=283, response_status=201, connection=49, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=282, response_duration_ms=0, request_bytes=396, response_bytes=196, cache_hit=false}
default	15:21:45.644207-0500	RedLemon	Task <EA1101ED-4EC5-4EE1-BBF1-16669A64947A>.<153> finished successfully
default	15:21:45.644655-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:45.645318-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3B745F2E-41B6-4D44-95A0-0F3E9DC1E41B] (reporting strategy default)> on Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> was not selected for reporting
default	15:21:45.646322-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:45.646559-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> now using Connection 49
default	15:21:45.646753-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> sent request, body N 0
default	15:21:45.793829-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> received response, status 200 content U
default	15:21:45.794034-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> done using Connection 49
default	15:21:45.794090-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:45.795053-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B341E73B-61B4-4D39-8D76-E742FB58597C] (reporting strategy default)> on Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> was not selected for reporting
default	15:21:45.794446-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> response ended
default	15:21:45.796052-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:45.796721-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> summary for task success {transaction_duration_ms=173, response_status=200, connection=49, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=170, response_duration_ms=1, request_bytes=98, response_bytes=533, cache_hit=false}
default	15:21:45.797024-0500	RedLemon	Task <1D6995A9-31A1-42C9-8F76-2FF4ED9FDFB9>.<154> finished successfully
default	15:21:45.798409-0500	RedLemon	Connection 51: enabling TLS
default	15:21:45.798454-0500	RedLemon	Connection 51: starting, TC(0x0)
default	15:21:45.798511-0500	RedLemon	[C51 DBBAAAAE-692C-45EB-AB72-AEE39E84A782 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{08F25BB4-DDC8-4105-B2A3-05A315DAF0CD}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:45.798612-0500	RedLemon	[C51 Hostname#e4bebcad:443 initial path ((null))] event: path:start @0.000s
default	15:21:45.801951-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:45.802625-0500	RedLemon	[C51 Hostname#e4bebcad:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.004s, uuid: B586A895-18F1-459D-87FA-031E3399622A
default	15:21:45.802867-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [52090A66-7478-474C-B7A2-942F08207A93] (reporting strategy default)> on Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> was not selected for reporting
default	15:21:45.803668-0500	mDNSResponder	[R958] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:45.803179-0500	RedLemon	[C51 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.004s
default	15:21:45.803272-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state preparing
default	15:21:45.803630-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> setting up Connection 51
default	15:21:45.804708-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:45.805124-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> now using Connection 49
default	15:21:45.805808-0500	mDNSResponder	[R958] getaddrinfo stop -- hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, client pid: 4026 (RedLemon)
default	15:21:45.806081-0500	RedLemon	nw_endpoint_resolver_update [C51 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#21f40c4c:443
default	15:21:45.806205-0500	RedLemon	[C51 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.007s
default	15:21:45.806544-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> sent request, body S 7
default	15:21:45.810430-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 initial path ((null))] event: path:start @0.011s
default	15:21:45.811014-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.012s, uuid: 11E0232B-3B57-4EDC-8BF4-C4ECC444FCB3
default	15:21:45.811177-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.012s
default	15:21:45.812807-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.014s
default	15:21:45.814133-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.015s
default	15:21:45.814449-0500	RedLemon	tcp_output [C51.1:3] flags=[S] seq=2884411859, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2884411859
default	15:21:45.817121-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-783 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:45.817362-0500	runningboardd	Assertion 174-4026-783 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:45.820362-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:45.820424-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:45.820692-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:45.821391-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-784 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:45.821590-0500	runningboardd	Assertion 174-114-784 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:45.826317-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:45.826669-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:45.826965-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:45.940325-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> received response, status 200 content U
default	15:21:45.940614-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> done using Connection 49
default	15:21:45.941020-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> response ended
default	15:21:45.941452-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> summary for task success {transaction_duration_ms=295, response_status=200, connection=49, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=294, response_duration_ms=0, request_bytes=98, response_bytes=458, cache_hit=false}
default	15:21:45.941871-0500	RedLemon	Task <A96938D8-BD70-4429-A2B2-2C8523CF522A>.<155> finished successfully
default	15:21:45.943248-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:45.943926-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8AF6AB11-303E-4BE1-B528-93A4FA98B5AD] (reporting strategy default)> on Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> was not selected for reporting
default	15:21:45.945070-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:45.945399-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> now using Connection 49
default	15:21:45.945672-0500	RedLemon	tcp_input [C51.1:3] flags=[S.] seq=4037848833, ack=2884411860, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2884411859
default	15:21:45.945806-0500	RedLemon	nw_flow_connected [C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:45.945998-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.147s
default	15:21:45.946082-0500	RedLemon	[C51 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.147s
default	15:21:45.946561-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C51.1:2][0x7fa206ea6310] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:45.946779-0500	RedLemon	boringssl_context_info_handler(2028) [C51.1:2][0x7fa206ea6310] Client handshake started
default	15:21:45.947022-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS client enter_early_data
default	15:21:45.947256-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS client read_server_hello
default	15:21:45.949341-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> sent request, body S 7
default	15:21:46.080266-0500	mDNSResponder	[R957] getaddrinfo stop -- hostname: <mask.hash: 'YvUIV3orAzkBrkkk9tx76w=='>, client pid: 4026 (RedLemon)
default	15:21:46.354367-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:46.428844-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:46.429661-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:46.430213-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:46.434372-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:46.436799-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:46.436891-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:46.437516-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C51.1:2][0x7fa206ea6310] Performing external trust evaluation
default	15:21:46.437694-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C51.1:2][0x7fa206ea6310] Asyncing for external verify block
default	15:21:46.437984-0500	RedLemon	Connection 51: asked to evaluate TLS Trust
default	15:21:46.438411-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> auth completion disp=1 cred=0x0
default	15:21:46.450478-0500	RedLemon	Connection 51: TLS Trust result 0
default	15:21:46.450563-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C51.1:2][0x7fa206ea6310] Returning from external verify block with result: true
default	15:21:46.450640-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C51.1:2][0x7fa206ea6310] Certificate verification result: OK
default	15:21:46.451396-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:46.451749-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:46.451776-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:46.451796-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:46.451817-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:46.452030-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS 1.3 client done
default	15:21:46.452233-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS client finish_client_handshake
default	15:21:46.452300-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fa206ea6310] Client handshake state: TLS client done
default	15:21:46.452343-0500	RedLemon	boringssl_context_info_handler(2034) [C51.1:2][0x7fa206ea6310] Client handshake done
default	15:21:46.453102-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C51.1:2][0x7fa206ea6310] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(506ms) flight_time(487ms) rtt(482ms) write_stalls(0) read_stalls(6)]
default	15:21:46.453493-0500	RedLemon	nw_flow_connected [C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:46.453903-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.655s
default	15:21:46.454221-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state ready
default	15:21:46.454299-0500	RedLemon	[C51 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.655s
default	15:21:46.454448-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.655s
default	15:21:46.454521-0500	RedLemon	[C51 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.655s
default	15:21:46.454859-0500	RedLemon	Connection 51: connected successfully
default	15:21:46.454916-0500	RedLemon	Connection 51: TLS handshake complete
default	15:21:46.455199-0500	RedLemon	Connection 51: ready C(N) E(N)
default	15:21:46.455462-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> now using Connection 51
default	15:21:46.455615-0500	RedLemon	Connection 51: received viability advisory(Y)
default	15:21:46.455848-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> sent request, body N 0
default	15:21:46.587788-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> received response, status 101 content U
default	15:21:46.588046-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> response ended
default	15:21:46.588115-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> done using Connection 51
default	15:21:46.588756-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.790s
default	15:21:46.588802-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state preparing
default	15:21:46.588871-0500	RedLemon	[C51 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.790s
default	15:21:46.589014-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.790s
default	15:21:46.589072-0500	RedLemon	[C51 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.790s
default	15:21:46.589148-0500	RedLemon	nw_flow_connected [C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:46.589402-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.790s
default	15:21:46.589503-0500	RedLemon	[C51 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.790s
default	15:21:46.592909-0500	RedLemon	nw_flow_connected [C51.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:46.593662-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.795s
default	15:21:46.593802-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state ready
default	15:21:46.593981-0500	RedLemon	[C51 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.795s
default	15:21:46.615185-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:46.726084-0500	RedLemon	tcp_input [C51.1:3] flags=[F.] seq=4037851864, ack=2884412914, win=249 state=ESTABLISHED rcv_nxt=4037851864, snd_una=2884412914
default	15:21:46.726164-0500	RedLemon	nw_protocol_tcp_log_summary [C51.1:3]
	[3439FBFD-111F-4138-AD97-7F0D06A12422 <private>:64925<-><private>:443]
	Init: 1, Conn_Time: 131.507ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 127.906ms, rtt_var: 4.812ms rtt_nc: 131.468ms, rtt_var_nc: 29.437ms base rtt: 125ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:46.727313-0500	RedLemon	nw_flow_disconnected [C51.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:21:46.728373-0500	RedLemon	Connection 51: read-side closed
default	15:21:46.728447-0500	RedLemon	Connection 51: read-side closed
default	15:21:46.728494-0500	RedLemon	Connection 51: read-side closed
default	15:21:46.729079-0500	RedLemon	[C51.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.930s, error Socket is not connected
default	15:21:46.729135-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state failed error Socket is not connected
default	15:21:46.729204-0500	RedLemon	[C51 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.930s
default	15:21:46.729268-0500	RedLemon	tcp_output [C51.1:3] flags=[F.] seq=2884413045, ack=4037851865, win=2048 state=LAST_ACK rcv_nxt=4037851865, snd_una=2884412914
error	15:21:46.729351-0500	RedLemon	Connection 51: received failure notification
error	15:21:46.729801-0500	RedLemon	nw_read_request_report [C51] Receive failed with error "Socket is not connected"
error	15:21:46.729890-0500	RedLemon	nw_flow_service_reads [C51.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	15:21:46.730566-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> summary for task success {transaction_duration_ms=934, response_status=101, connection=51, protocol="http/1.1", domain_lookup_duration_ms=3, connect_duration_ms=640, secure_connection_duration_ms=506, private_relay=false, request_start_ms=660, request_duration_ms=0, response_start_ms=791, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	15:21:46.730669-0500	RedLemon	Task <3E67FB37-D4B7-470D-968A-34791DE52DEF>.<1> finished successfully
error	15:21:46.730789-0500	RedLemon	nw_flow_add_write_request [C51.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:21:46.730846-0500	RedLemon	nw_write_request_report [C51] Send failed with error "Socket is not connected"
default	15:21:46.731385-0500	RedLemon	Connection 51: cleaning up
default	15:21:46.731857-0500	RedLemon	[C51 DBBAAAAE-692C-45EB-AB72-AEE39E84A782 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:21:46.732990-0500	RedLemon	[C51 DBBAAAAE-692C-45EB-AB72-AEE39E84A782 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C51.1 11E0232B-3B57-4EDC-8BF4-C4ECC444FCB3 10.0.0.249:64925<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.933s, DNS @0.004s took 0.003s, TCP @0.790s took 0.132s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:46.733791-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state cancelled error Socket is not connected
default	15:21:46.734025-0500	RedLemon	Connection 51: done
default	15:21:46.851942-0500	RedLemon	⚠️ Received Realtime message with no chat text
error	15:21:46.856801-0500	RedLemon	tcp_input [C51.1:3] flags=[R] seq=4037851865, ack=0, win=0 state=LAST_ACK rcv_nxt=4037851865, snd_una=2884412914
error	15:21:46.860981-0500	RedLemon	tcp_input [C51.1:3] flags=[R] seq=4037851865, ack=0, win=0 state=CLOSED rcv_nxt=4037851865, snd_una=2884412914
error	15:21:46.861073-0500	RedLemon	tcp_input [C51.1:3] flags=[R] seq=4037851865, ack=0, win=0 state=CLOSED rcv_nxt=4037851865, snd_una=2884412914
error	15:21:46.861125-0500	RedLemon	tcp_input [C51.1:3] flags=[R] seq=4037851865, ack=0, win=0 state=CLOSED rcv_nxt=4037851865, snd_una=2884412914
error	15:21:46.861175-0500	RedLemon	tcp_input [C51.1:3] flags=[R] seq=4037851865, ack=0, win=0 state=CLOSED rcv_nxt=4037851865, snd_una=2884412914
error	15:21:46.861239-0500	RedLemon	tcp_input [C51.1:3] flags=[R] seq=4037851865, ack=0, win=0 state=CLOSED rcv_nxt=4037851865, snd_una=2884412914
default	15:21:46.932542-0500	runningboardd	Invalidating assertion 174-4026-783 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:47.014872-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> received response, status 204 content U
default	15:21:47.015320-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> done using Connection 49
default	15:21:47.015902-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> response ended
default	15:21:47.017129-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> summary for task success {transaction_duration_ms=1213, response_status=204, connection=49, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=1211, response_duration_ms=2, request_bytes=123, response_bytes=48, cache_hit=false}
default	15:21:47.017554-0500	RedLemon	Task <A4A0EC3C-E141-4D1E-B24B-0FF5E80F6268>.<156> finished successfully
default	15:21:47.017914-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:47.021814-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4E09FBEB-75FD-428F-9D66-D0065C25F2E9] (reporting strategy default)> on Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> was not selected for reporting
default	15:21:47.024983-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:47.025275-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> now using Connection 49
default	15:21:47.025640-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> sent request, body N 0
default	15:21:47.038757-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> received response, status 204 content U
default	15:21:47.038953-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> done using Connection 49
default	15:21:47.039218-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> response ended
default	15:21:47.039486-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> summary for task success {transaction_duration_ms=1095, response_status=204, connection=49, reused=1, request_start_ms=3, request_duration_ms=1, response_start_ms=1094, response_duration_ms=0, request_bytes=124, response_bytes=48, cache_hit=false}
default	15:21:47.039994-0500	RedLemon	Task <00BCA9A9-8578-47B1-8145-24C9907659B9>.<157> finished successfully
default	15:21:47.042738-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:47.046540-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7F2DEFEA-1FD0-4CBF-9DD4-0F5EC52D7095] (reporting strategy default)> on Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> was not selected for reporting
default	15:21:47.047665-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:47.048245-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> now using Connection 49
default	15:21:47.048554-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> sent request, body N 0
default	15:21:47.102436-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:47.103117-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:47.103169-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:47.103214-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:47.104731-0500	runningboardd	Invalidating assertion 174-114-784 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:47.266999-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:47.267050-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:47.267098-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:47.360323-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:47.667236-0500	RedLemon	CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transaction isn't created on a main thread.
default	15:21:47.667805-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:47.850287-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:47.949733-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> received response, status 200 content U
default	15:21:47.949850-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> done using Connection 49
default	15:21:47.950119-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> response ended
default	15:21:47.950356-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> summary for task success {transaction_duration_ms=926, response_status=200, connection=49, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=926, response_duration_ms=0, request_bytes=98, response_bytes=578, cache_hit=true}
default	15:21:47.950637-0500	RedLemon	Task <145C351D-15EF-4507-BB6B-970C0C044F86>.<158> finished successfully
default	15:21:47.951486-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:47.952014-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9D83D197-DB62-49C7-AC6E-B09DC16A4DB0] (reporting strategy default)> on Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> was not selected for reporting
default	15:21:47.953068-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-785 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:47.953146-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:47.953607-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> now using Connection 49
default	15:21:47.953629-0500	runningboardd	Assertion 174-4026-785 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:47.954488-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> sent request, body S 47
default	15:21:47.955138-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:47.955200-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:47.955251-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:47.959634-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> received response, status 200 content U
default	15:21:47.959752-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> done using Connection 49
default	15:21:47.959968-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> response ended
default	15:21:47.960309-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> summary for task success {transaction_duration_ms=913, response_status=200, connection=49, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=912, response_duration_ms=0, request_bytes=98, response_bytes=500, cache_hit=true}
default	15:21:47.960622-0500	RedLemon	Task <F42ED4A9-A822-4949-93F4-C4FA1ED5BD6E>.<159> finished successfully
default	15:21:47.961648-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:21:47.962770-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F1430768-E7F8-4C73-909E-920F533FAEF2] (reporting strategy default)> on Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> was not selected for reporting
default	15:21:47.963952-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:47.964454-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> now using Connection 49
default	15:21:47.966733-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> sent request, body S 47
default	15:21:47.969252-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-786 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:47.969542-0500	runningboardd	Assertion 174-114-786 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:47.970565-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:47.970632-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:47.970695-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:48.094749-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:48.128686-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> received response, status 200 content U
default	15:21:48.128818-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> done using Connection 49
default	15:21:48.129012-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> response ended
default	15:21:48.129262-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> summary for task success {transaction_duration_ms=176, response_status=200, connection=49, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=176, response_duration_ms=0, request_bytes=150, response_bytes=538, cache_hit=true}
default	15:21:48.129587-0500	RedLemon	Task <AE0A454E-3AC4-48BC-81EA-BD189250ABB8>.<160> finished successfully
default	15:21:48.130708-0500	RedLemon	✅ Unlocked successfully: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX.mkv
default	15:21:48.133754-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> received response, status 200 content K
default	15:21:48.134109-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> response ended
default	15:21:48.134212-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> done using Connection 48
default	15:21:48.134424-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> summary for task success {transaction_duration_ms=3220, response_status=200, connection=48, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=2, secure_connection_duration_ms=0, private_relay=false, request_start_ms=4, request_duration_ms=1, response_start_ms=3219, response_duration_ms=0, request_bytes=372, response_bytes=376, cache_hit=true}
default	15:21:48.134638-0500	RedLemon	Task <2E88B970-9708-439D-8418-F2EAC6CBB963>.<150> finished successfully
default	15:21:48.134903-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	15:21:48.135314-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:48.135314-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:48.135315-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:48.137279-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0147E583-9AA6-4BD3-A39C-962F4CAEEAA1] (reporting strategy default)> on Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> was not selected for reporting
default	15:21:48.137532-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [554236AC-395B-40CC-9E1E-D994A6F07B83] (reporting strategy default)> on Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> was not selected for reporting
default	15:21:48.137785-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9EAB5159-EA2B-488B-9524-5A1A90A370A9] (reporting strategy default)> on Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> was not selected for reporting
default	15:21:48.145390-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:48.146087-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:21:48.146645-0500	RedLemon	Connection 52: enabling TLS
default	15:21:48.146684-0500	RedLemon	Connection 52: starting, TC(0x0)
default	15:21:48.146739-0500	RedLemon	[C52 DCDDBDF3-039B-44B4-9275-1A395C6E1BD5 Hostname#65f64ccc:443 quic-connection, url hash: 3b0fab9d, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{BB95AF92-846A-4B9C-AA4E-FAA954B8F9E9}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:48.146842-0500	RedLemon	[C52 Hostname#65f64ccc:443 initial path ((null))] event: path:start @0.000s
default	15:21:48.147239-0500	RedLemon	[C52 Hostname#65f64ccc:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 3B73C7FD-B426-41B6-A4B2-FBAF017533D8
default	15:21:48.147427-0500	RedLemon	[C52 Hostname#65f64ccc:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:21:48.147469-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state preparing
default	15:21:48.147998-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 initial path ((null))] event: path:start @0.001s
default	15:21:48.150604-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: BCF09654-C76D-46E2-B0DC-00CF245DF0E5
default	15:21:48.152808-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.005s
default	15:21:48.153347-0500	mDNSResponder	[R959] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'VkU6jUPj8QTibCrwfcJdZQ=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:48.153552-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> setting up Connection 52
default	15:21:48.154030-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:48.154129-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> waiting for setup of Connection 52
default	15:21:48.154201-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:48.154279-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> waiting for setup of Connection 52
default	15:21:48.161768-0500	RedLemon	nw_endpoint_resolver_update [C52.1 Hostname#65f64ccc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#b5215f7f.443
default	15:21:48.162162-0500	RedLemon	nw_endpoint_resolver_update [C52.1 Hostname#65f64ccc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e4e320ac:443
default	15:21:48.162652-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.015s
default	15:21:48.162918-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 initial path ((null))] event: path:start @0.016s
default	15:21:48.163413-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.016s, uuid: 6D216242-B6C6-473E-88DE-36B073DE9CF7
default	15:21:48.163634-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.016s
default	15:21:48.167670-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.020s
default	15:21:48.169569-0500	RedLemon	nw_protocol_instance_ignore_future_path_changes [C52.1.1:2] Ignoring future path changes for protocol
default	15:21:48.169682-0500	RedLemon	quic_initialize_block_invoke [C52.1.1:2] [-f9b390311b972afe] created QUIC connection (spin bit enabled)
default	15:21:48.170680-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.023s
default	15:21:48.177984-0500	RedLemon	quic_crypto_new_flow [C52.1.1:2] [-f9b390311b972afe] TLS stream is: [C53]
default	15:21:48.178096-0500	RedLemon	[C53 E0C29CF0-03CE-4F3F-AB86-35709426B154 IPv6#b5215f7f.443 quic-connection, url hash: 3b0fab9d, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{BB95AF92-846A-4B9C-AA4E-FAA954B8F9E9}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6, no transport] start
default	15:21:48.180071-0500	RedLemon	[C53 IPv6#b5215f7f.443 initial socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:start @0.001s
default	15:21:48.180525-0500	RedLemon	[C53 IPv6#b5215f7f.443 waiting socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: 6D216242-B6C6-473E-88DE-36B073DE9CF7
default	15:21:48.180730-0500	RedLemon	[C53 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.002s
default	15:21:48.180773-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state preparing
default	15:21:48.180968-0500	RedLemon	nw_flow_connected [C53 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	15:21:48.183684-0500	RedLemon	[C53 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.005s
default	15:21:48.185726-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C53:1][0x7fa205b87450] TLS configured [min_version(0x0304) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:48.186311-0500	RedLemon	boringssl_context_info_handler(2028) [C53:1][0x7fa205b87450] Client handshake started
default	15:21:48.186556-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS client enter_early_data
default	15:21:48.187088-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS client read_server_hello
default	15:21:48.189119-0500	mDNSResponder	[R959] getaddrinfo stop -- hostname: <mask.hash: 'VkU6jUPj8QTibCrwfcJdZQ=='>, client pid: 4026 (RedLemon)
default	15:21:48.191669-0500	RedLemon	nw_endpoint_resolver_update [C52.1 Hostname#65f64ccc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e4e320ac:443
default	15:21:48.193093-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.046s
default	15:21:48.193387-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> received response, status 200 content U
default	15:21:48.193516-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> done using Connection 49
default	15:21:48.193744-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> response ended
default	15:21:48.194084-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> summary for task success {transaction_duration_ms=230, response_status=200, connection=49, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=229, response_duration_ms=0, request_bytes=150, response_bytes=502, cache_hit=true}
default	15:21:48.195137-0500	RedLemon	Task <AFA44F99-B7C3-4614-9A01-7076E84B687C>.<161> finished successfully
default	15:21:48.196101-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	15:21:48.199568-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> received response, status 200 content K
default	15:21:48.199919-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> response ended
default	15:21:48.200016-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> done using Connection 50
default	15:21:48.200227-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> summary for task success {transaction_duration_ms=2856, response_status=200, connection=50, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=4, secure_connection_duration_ms=0, private_relay=false, request_start_ms=10, request_duration_ms=2, response_start_ms=2856, response_duration_ms=0, request_bytes=372, response_bytes=357, cache_hit=true}
default	15:21:48.200442-0500	RedLemon	Task <24D6B649-B266-4430-B390-205E87ACE5E7>.<152> finished successfully
default	15:21:48.200686-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	15:21:48.200926-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:48.200926-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:48.200947-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:48.202925-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2E17EE36-756B-4F68-A94E-8C273FC43E15] (reporting strategy default)> on Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> was not selected for reporting
default	15:21:48.202986-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [614C93E5-BD22-47A4-9E0A-2D250AB99BBD] (reporting strategy default)> on Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> was not selected for reporting
default	15:21:48.203258-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F2EEAC14-AF95-4D88-BD68-466E449575E3] (reporting strategy default)> on Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> was not selected for reporting
error	15:21:48.204343-0500	RedLemon	quic_packet_parser_inner [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] SH fixed bit is zero
default	15:21:48.209119-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:48.209255-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> waiting for setup of Connection 52
default	15:21:48.210150-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:48.210244-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:48.211153-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client read_encrypted_extensions
error	15:21:48.211510-0500	RedLemon	quic_packet_parser_inner [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] SH fixed bit is zero
default	15:21:48.211772-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:48.212193-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:48.212313-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:48.212810-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C53:1][0x7fa205b87450] Performing external trust evaluation
default	15:21:48.213005-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C53:1][0x7fa205b87450] Asyncing for external verify block
default	15:21:48.213974-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:48.214087-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> waiting for setup of Connection 52
default	15:21:48.214167-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:48.214590-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> waiting for setup of Connection 52
default	15:21:48.219815-0500	RedLemon	Connection 52: asked to evaluate TLS Trust
default	15:21:48.220787-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> auth completion disp=1 cred=0x0
default	15:21:48.238190-0500	RedLemon	Connection 52: TLS Trust result 0
default	15:21:48.238271-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C53:1][0x7fa205b87450] Returning from external verify block with result: true
default	15:21:48.238372-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C53:1][0x7fa205b87450] Certificate verification result: OK
default	15:21:48.239106-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:48.239362-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:48.239476-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:48.239770-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:48.239816-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:48.240727-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS 1.3 client done
default	15:21:48.241019-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS client finish_client_handshake
default	15:21:48.241735-0500	RedLemon	boringssl_context_info_handler(2045) [C53:1][0x7fa205b87450] Client handshake state: TLS client done
default	15:21:48.241899-0500	RedLemon	boringssl_context_info_handler(2034) [C53:1][0x7fa205b87450] Client handshake done
default	15:21:48.243385-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C53:1][0x7fa205b87450] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(56ms) flight_time(25ms) rtt(24ms) write_stalls(0) read_stalls(4)]
default	15:21:48.243524-0500	RedLemon	nw_flow_connected [C53 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	15:21:48.243757-0500	RedLemon	[C53 IPv6#b5215f7f.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.065s
default	15:21:48.244102-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state ready
default	15:21:48.244174-0500	RedLemon	[C53 IPv6#b5215f7f.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.066s
default	15:21:48.246457-0500	RedLemon	quic_pmtud_restart [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] PMTUD enabled, max PMTU: 1398, header size: 48, current PMTU 1248
default	15:21:48.246572-0500	RedLemon	quic_crypto_tls_ready_inner [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] QUIC connection established in 75.615 ms, RTT 17.429 ms
default	15:21:48.246665-0500	RedLemon	nw_flow_connected [C52.1.1 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	15:21:48.246890-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.100s
default	15:21:48.247031-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.100s
default	15:21:48.247092-0500	RedLemon	[C52 Hostname#65f64ccc:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.100s
default	15:21:48.247256-0500	RedLemon	nw_flow_connected [C52.1.1 IPv6#b5215f7f.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:48.247644-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.100s
default	15:21:48.248531-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state ready
default	15:21:48.248908-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.102s
default	15:21:48.249757-0500	RedLemon	[C52 Hostname#65f64ccc:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.102s
default	15:21:48.250226-0500	RedLemon	[C52.1.1 IPv6#b5215f7f.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.103s
default	15:21:48.250384-0500	RedLemon	[C52.1 Hostname#65f64ccc:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.103s
default	15:21:48.250509-0500	RedLemon	[C52 Hostname#65f64ccc:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.103s
default	15:21:48.251168-0500	RedLemon	Connection 52: connected successfully
default	15:21:48.251250-0500	RedLemon	Connection 52: TLS handshake complete
default	15:21:48.251559-0500	RedLemon	Connection 52: ready C(N) E(N)
default	15:21:48.253467-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> now using Connection 52
default	15:21:48.254852-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> now using Connection 52
default	15:21:48.256079-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> now using Connection 52
default	15:21:48.261033-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> now using Connection 52
default	15:21:48.263405-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> now using Connection 52
default	15:21:48.267117-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> now using Connection 52
default	15:21:48.268636-0500	RedLemon	Connection 52: received viability advisory(Y)
default	15:21:48.268714-0500	RedLemon	0x7fa206533d88 ID=0 Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> sent request, body N 0
default	15:21:48.268774-0500	RedLemon	0x7fa205d4eb88 ID=4 Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> sent request, body N 0
default	15:21:48.268826-0500	RedLemon	0x7fa205dc7688 ID=8 Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> sent request, body N 0
default	15:21:48.268874-0500	RedLemon	0x7fa206e6f0e8 ID=12 Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> sent request, body N 0
default	15:21:48.268923-0500	RedLemon	0x7fa205d4c0b8 ID=16 Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> sent request, body N 0
default	15:21:48.268970-0500	RedLemon	0x7fa205d99a58 ID=20 Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> sent request, body N 0
default	15:21:48.269723-0500	RedLemon	boringssl_context_new_session_handler(1336) [C53:1][0x7fa205b87450] Asyncing for session update block
default	15:21:48.270207-0500	RedLemon	boringssl_context_new_session_handler(1336) [C53:1][0x7fa205b87450] Asyncing for session update block
default	15:21:48.270560-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C53:1][0x7fa205b87450] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(56ms) flight_time(25ms) rtt(24ms) write_stalls(0) read_stalls(4)]
default	15:21:48.270703-0500	RedLemon	nw_flow_connected [C53 IPv6#b5215f7f.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	15:21:48.271063-0500	RedLemon	quic_stream_create_inbound [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] creating inbound stream 3
default	15:21:48.271703-0500	RedLemon	quic_stream_create_inbound [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] creating inbound stream 7
default	15:21:48.272226-0500	RedLemon	quic_stream_create_inbound [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] creating inbound stream 11
default	15:21:48.277179-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C53:1][0x7fa205b87450] Returning from session update block
default	15:21:48.278357-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C53:1][0x7fa205b87450] Returning from session update block
default	15:21:48.278893-0500	RedLemon	quic_stream_create_inbound [C52.1.1:2] [-01bdd9b1af6e1dcd67bec8b13c6eb833fb6d9091] creating inbound stream 15
default	15:21:48.363919-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:48.412926-0500	RedLemon	0x7fa205dc7688 ID=8 Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> received response, status 200 content U
default	15:21:48.421668-0500	RedLemon	0x7fa205d4eb88 ID=4 Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> received response, status 200 content U
default	15:21:48.434350-0500	RedLemon	0x7fa206533d88 ID=0 Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> received response, status 200 content K
default	15:21:48.443468-0500	RedLemon	0x7fa206e6f0e8 ID=12 Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> received response, status 200 content U
default	15:21:48.446261-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> response ended
default	15:21:48.447443-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> done using Connection 52
default	15:21:48.449475-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> summary for task success {transaction_duration_ms=311, response_status=200, connection=52, protocol="h3", domain_lookup_duration_ms=10, connect_duration_ms=77, secure_connection_duration_ms=75, private_relay=false, request_start_ms=115, request_duration_ms=15, response_start_ms=296, response_duration_ms=13, request_bytes=112, response_bytes=3275, cache_hit=true}
default	15:21:48.449918-0500	RedLemon	Task <5DCA0284-CE4A-4E0F-9C03-3BCB2F167721>.<163> finished successfully
default	15:21:48.452584-0500	RedLemon	0x7fa205d4c0b8 ID=16 Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> received response, status 200 content K
default	15:21:48.454338-0500	RedLemon	0x7fa205d99a58 ID=20 Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> received response, status 200 content U
default	15:21:48.461304-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> response ended
default	15:21:48.462611-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> done using Connection 52
default	15:21:48.463403-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> summary for task success {transaction_duration_ms=258, response_status=200, connection=52, reused=1, request_start_ms=58, request_duration_ms=5, response_start_ms=247, response_duration_ms=10, request_bytes=112, response_bytes=3285, cache_hit=true}
default	15:21:48.463929-0500	RedLemon	Task <B5F52CC2-F40F-4E72-ABD4-C97EC09A6425>.<165> finished successfully
default	15:21:48.510824-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> response ended
default	15:21:48.512339-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> done using Connection 52
default	15:21:48.513288-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> summary for task success {transaction_duration_ms=309, response_status=200, connection=52, reused=1, request_start_ms=57, request_duration_ms=7, response_start_ms=239, response_duration_ms=69, request_bytes=112, response_bytes=39907, cache_hit=true}
default	15:21:48.514440-0500	RedLemon	Task <3FA27243-EF45-4273-88E9-DF8F0205A781>.<167> finished successfully
default	15:21:48.537219-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> response ended
default	15:21:48.538511-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> done using Connection 52
default	15:21:48.539050-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> summary for task success {transaction_duration_ms=395, response_status=200, connection=52, reused=1, request_start_ms=111, request_duration_ms=13, response_start_ms=277, response_duration_ms=117, request_bytes=112, response_bytes=39901, cache_hit=true}
default	15:21:48.539814-0500	RedLemon	Task <FBCE27E3-FE36-4DEF-BA33-A2606AD874CD>.<164> finished successfully
default	15:21:48.553026-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> response ended
default	15:21:48.554220-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> done using Connection 52
default	15:21:48.554976-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> summary for task success {transaction_duration_ms=409, response_status=200, connection=52, reused=1, request_start_ms=110, request_duration_ms=12, response_start_ms=267, response_duration_ms=141, request_bytes=112, response_bytes=91154, cache_hit=true}
default	15:21:48.555879-0500	RedLemon	Task <137E0C8B-1D3D-4762-8FEF-F9AD263956B9>.<162> finished successfully
default	15:21:48.570353-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> response ended
default	15:21:48.572102-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> done using Connection 52
default	15:21:48.573533-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> summary for task success {transaction_duration_ms=368, response_status=200, connection=52, reused=1, request_start_ms=61, request_duration_ms=1, response_start_ms=248, response_duration_ms=118, request_bytes=112, response_bytes=91150, cache_hit=true}
default	15:21:48.574357-0500	RedLemon	Task <A2EEFD8D-FEA5-4A64-A254-A89D28AC6A77>.<166> finished successfully
default	15:21:48.616190-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi9-4.download.real-debrid.com/d/22XVHNYXBICRK110/F, subtitles: 3
default	15:21:48.666512-0500	RedLemon	✅ Stream ready, starting playback...
default	15:21:48.666659-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	15:21:48.666901-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fa201fa9e10>
default	15:21:48.667042-0500	RedLemon	   Is fullscreen: 0
default	15:21:48.667148-0500	RedLemon	   ✅ WindowManager: Toggling fullscreen ON
default	15:21:48.713092-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:48.720000-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	15:21:48.725665-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	15:21:48.728992-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	15:21:48.729187-0500	RedLemon	🎉 Starting watch party sync - Room: 7KB4, Host: NO
default	15:21:48.729358-0500	RedLemon	🎉 Watch Party Mode ENABLED. isInWatchParty = YES
default	15:21:48.781785-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi3-4.download.real-debrid.com/d/NTJXPL4N6WSII91/Fr, subtitles: 3
default	15:21:48.853919-0500	runningboardd	Invalidating assertion 174-171-743 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	15:21:48.855268-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:174-171-787 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:48.855971-0500	runningboardd	Assertion 174-171-787 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:48.985621-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	15:21:48.993052-0500	runningboardd	Invalidating assertion 174-4026-785 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:49.007796-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	15:21:49.010896-0500	RedLemon	✅ Stream ready, starting playback...
default	15:21:49.011593-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	15:21:49.012262-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fa201fa9e10>
default	15:21:49.012424-0500	RedLemon	   Is fullscreen: 1
default	15:21:49.012535-0500	RedLemon	   ⚠️ WindowManager: Already in fullscreen
default	15:21:49.012820-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	15:21:49.012970-0500	RedLemon	🎉 Starting watch party sync - Room: 7KB4, Host: NO
default	15:21:49.013154-0500	RedLemon	🎉 Watch Party Mode ENABLED. isInWatchParty = YES
default	15:21:49.018661-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:21:49.025098-0500	RedLemon	🔄 Starting chat polling for room: 7KB4
default	15:21:49.026253-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	15:21:49.027118-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	15:21:49.027290-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	15:21:49.027493-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	15:21:49.028554-0500	RedLemon	🎬🎬🎬 streamURL: https://chi9-4.download.real-debrid.com/d/22XVHNYXBICRK110/F
default	15:21:49.028785-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	15:21:49.029871-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi9-4.download.real-debrid.com/d/22XVHNYXBICRK110/Frankenstein%202025%201080p%20NF%20WEB-DL, autoplay: false
default	15:21:49.030106-0500	RedLemon	⏸️ Loading in paused mode (watch party)
default	15:21:49.030261-0500	RedLemon	🔗 URL: https://chi9-4.download.real-debrid.com/d/22XVHNYXBICRK110/Frankenstein%202025%201080p%20NF%20WEB-DL%20DDP5%201%20Atmos%20H%20264-FLUX.mkv
default	15:21:49.030527-0500	RedLemon	🎬 MPV executing: loadfile "https://chi9-4.download.real-debrid.com/d/22XVHNYXBICRK110/Frankenstein%202025%201080p%20NF%20WEB-DL%20DDP5%201%20Atmos%20H%20264-FLUX.mkv"
default	15:21:49.031580-0500	RedLemon	🎬 MPV loadfile result: 0
default	15:21:49.034910-0500	mDNSResponder	[R960] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'ORqtM8dvn3PkTr+4hhz9NA=='>, Addr) START PID[4026](RedLemon)
default	15:21:49.032886-0500	RedLemon	✅ MPV loadfile succeeded, immediately paused for watch party
default	15:21:49.036043-0500	mDNSResponder	[R961] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'ORqtM8dvn3PkTr+4hhz9NA=='>, AAAA) START PID[4026](RedLemon)
default	15:21:49.036902-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	15:21:49.038352-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	15:21:49.041804-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> summary for task success {transaction_duration_ms=12145, response_status=101, connection=44, protocol="http/1.1", domain_lookup_duration_ms=4, connect_duration_ms=88, secure_connection_duration_ms=67, private_relay=false, request_start_ms=99, request_duration_ms=0, response_start_ms=263, response_duration_ms=1, request_bytes=828, response_bytes=850, cache_hit=false}
default	15:21:49.041944-0500	RedLemon	Connection 44: cleaning up
default	15:21:49.041953-0500	RedLemon	Task <BFE90AA8-82E2-44BD-A807-02C35D750A84>.<2> finished successfully
default	15:21:49.042021-0500	RedLemon	[C44 DDE0BDC6-B124-4C1B-92A8-8242D8B5DB05 Hostname#2136ba9d:443 tcp, url hash: 450ba5fb, tls, definite, attribution: developer] cancel
default	15:21:49.042154-0500	RedLemon	[C44 DDE0BDC6-B124-4C1B-92A8-8242D8B5DB05 Hostname#2136ba9d:443 tcp, url hash: 450ba5fb, tls, definite, attribution: developer] cancelled
	[C44.1 37446861-BEDF-403E-90CC-542889EB13C1 10.0.0.249:64920<->IPv4#b142724a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 12.144s, DNS @0.000s took 0.004s, TCP @0.264s took 0.018s, TLS 1.3 took 0.001s
	bytes in/out: 9077/3024, packets in/out: 22/31, rtt: 0.023s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:49.043097-0500	RedLemon	nw_flow_disconnected [C44.1 IPv4#b142724a:443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:21:49.043476-0500	RedLemon	nw_protocol_tcp_log_summary [C44.1:3]
	[82069457-45B9-4B34-9F83-59918315AFA9 <private>:64920<-><private>:443]
	Init: 1, Conn_Time: 17.449ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 23.031ms, rtt_var: 7.937ms rtt_nc: 21.468ms, rtt_var_nc: 9.375ms base rtt: 13ms
	ACKs-compressed: 0, ACKs delayed: 3 delayed ACKs sent: 0
default	15:21:49.043920-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state cancelled
error	15:21:49.044114-0500	RedLemon	Read completed with an error <private>
default	15:21:49.044178-0500	RedLemon	Connection 44: done
default	15:21:49.044488-0500	RedLemon	tcp_output [C44.1:3] flags=[F.] seq=3023753391, ack=2633584204, win=2048 state=FIN_WAIT_1 rcv_nxt=2633584204, snd_una=3023752542
default	15:21:49.045619-0500	RedLemon	Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:49.046068-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C332F0D9-5E8D-4DC5-B72C-6034B73DE4FD] (reporting strategy default)> on Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> was not selected for reporting
default	15:21:49.047234-0500	RedLemon	Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:49.047619-0500	RedLemon	Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> now using Connection 2
default	15:21:49.048773-0500	RedLemon	0x7fa20651eda8 ID=372 Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> sent request, body N 0
default	15:21:49.049773-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_CC15B28E-C916-49B2-9EF5-78605AD0C129/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	15:21:49.050170-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_CC15B28E-C916-4
default	15:21:49.062194-0500	mDNSResponder	[R960] DNSServiceQueryRecord(1D000, 0, <mask.hash: '0IE4iAxySjQekMrLmedy8A=='>, Addr) STOP PID[4026](RedLemon)
default	15:21:49.062289-0500	mDNSResponder	[R961] DNSServiceQueryRecord(1D000, 0, <mask.hash: '0IE4iAxySjQekMrLmedy8A=='>, AAAA) STOP PID[4026](RedLemon)
default	15:21:49.073004-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:21:49.073432-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein (2025) eng): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_34F31BC1-53EA-4200-8182-2A55B544BD0D/Frankenstein (2025) eng.srt
default	15:21:49.073756-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_34F31BC1-53EA-4
default	15:21:49.089557-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:21:49.089828-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_06524833-38A8-466C-9ADA-93E57C756FD0/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	15:21:49.090081-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_06524833-38A8-4
default	15:21:49.111696-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:21:49.111840-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	15:21:49.112114-0500	RedLemon	🔄 Starting chat polling for room: 7KB4
default	15:21:49.112272-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	15:21:49.112400-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	15:21:49.112502-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	15:21:49.112679-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	15:21:49.112849-0500	RedLemon	🎬🎬🎬 streamURL: https://chi3-4.download.real-debrid.com/d/NTJXPL4N6WSII91/Fr
default	15:21:49.112950-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	15:21:49.113337-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi3-4.download.real-debrid.com/d/NTJXPL4N6WSII91/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.A, autoplay: false
default	15:21:49.113462-0500	RedLemon	⏸️ Loading in paused mode (watch party)
default	15:21:49.113565-0500	RedLemon	🔗 URL: https://chi3-4.download.real-debrid.com/d/NTJXPL4N6WSII91/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	15:21:49.113693-0500	RedLemon	🎬 MPV executing: loadfile "https://chi3-4.download.real-debrid.com/d/NTJXPL4N6WSII91/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv"
default	15:21:49.113856-0500	RedLemon	🎬 MPV loadfile result: 0
default	15:21:49.114015-0500	RedLemon	✅ MPV loadfile succeeded, immediately paused for watch party
default	15:21:49.114171-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	15:21:49.114478-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	15:21:49.134103-0500	RedLemon	Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:49.137291-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_1B99538C-4B15-480B-9C1B-14F58046AD02/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	15:21:49.137531-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_1B99538C-4B15-4
default	15:21:49.137540-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [03198A14-4B57-47B7-A75C-67072DC3EF8B] (reporting strategy default)> on Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> was not selected for reporting
default	15:21:49.139976-0500	RedLemon	0x7fa20651eda8 ID=372 Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> received response, status 200 content K
default	15:21:49.141496-0500	RedLemon	Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> response ended
default	15:21:49.142843-0500	RedLemon	Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> done using Connection 2
default	15:21:49.143573-0500	RedLemon	Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:49.144081-0500	RedLemon	Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> now using Connection 2
default	15:21:49.144494-0500	RedLemon	❌ Failed to load subtitle, MPV error code: -12
default	15:21:49.144716-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein (2025) eng): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_018395E0-4C45-4677-A60C-DBBE1ECB49BA/Frankenstein (2025) eng.srt
default	15:21:49.144938-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_018395E0-4C45-4
default	15:21:49.147965-0500	RedLemon	Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> summary for task success {transaction_duration_ms=101, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=93, response_duration_ms=3, request_bytes=529, response_bytes=663, cache_hit=false}
default	15:21:49.148710-0500	RedLemon	Task <621F7607-944F-45CB-8DD3-6AD6A0ED4686>.<168> finished successfully
default	15:21:49.156965-0500	RedLemon	0x7fa20658c358 ID=376 Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> sent request, body N 0
default	15:21:49.159897-0500	mDNSResponder	[R962] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, Addr) START PID[4026](RedLemon)
default	15:21:49.161381-0500	mDNSResponder	[R963] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, AAAA) START PID[4026](RedLemon)
default	15:21:49.163070-0500	mDNSResponder	[R962] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, Addr) STOP PID[4026](RedLemon)
default	15:21:49.163188-0500	mDNSResponder	[R963] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, AAAA) STOP PID[4026](RedLemon)
default	15:21:49.176739-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:21:49.176909-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_1FF1ADE9-CF43-4163-8DD7-A7AD5F527B51/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	15:21:49.177050-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_1FF1ADE9-CF43-4
default	15:21:49.190500-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:21:49.190655-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	15:21:49.197047-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:49.197442-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7D655D8E-5B84-4A28-BB60-FEB113CB77D3] (reporting strategy default)> on Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> was not selected for reporting
default	15:21:49.198544-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:49.198772-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> now using Connection 41
default	15:21:49.199523-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> sent request, body N 0
default	15:21:49.208811-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> received response, status 200 content K
default	15:21:49.210941-0500	RedLemon	0x7fa20658c358 ID=376 Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> received response, status 200 content K
default	15:21:49.211836-0500	RedLemon	Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> response ended
default	15:21:49.212924-0500	RedLemon	Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> done using Connection 2
default	15:21:49.213423-0500	RedLemon	Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> summary for task success {transaction_duration_ms=74, response_status=200, connection=2, reused=1, request_start_ms=5, request_duration_ms=12, response_start_ms=72, response_duration_ms=2, request_bytes=529, response_bytes=664, cache_hit=false}
default	15:21:49.213908-0500	RedLemon	Task <3EE4F356-279F-4E9E-A751-667585B919C7>.<169> finished successfully
default	15:21:49.215989-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> done using Connection 41
default	15:21:49.218838-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-789 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:49.219167-0500	runningboardd	Assertion 174-4026-789 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:49.216219-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> response ended
default	15:21:49.218707-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> summary for task success {transaction_duration_ms=20, response_status=200, connection=41, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=9, response_duration_ms=8, request_bytes=41, response_bytes=117959, cache_hit=false}
default	15:21:49.218823-0500	RedLemon	Task <803BA324-6A36-479E-944A-7BE096B8E838>.<170> finished successfully
default	15:21:49.221558-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:49.221838-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:49.222122-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:49.271828-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:49.274161-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:49.274241-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:49.276508-0500	runningboardd	Invalidating assertion 174-114-786 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:49.278476-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-791 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:49.278836-0500	runningboardd	Assertion 174-114-791 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:49.526001-0500	runningboardd	Invalidating assertion 174-171-787 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	15:21:49.535375-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:174-171-792 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:49.535857-0500	runningboardd	Assertion 174-171-792 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:49.906608-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:49.907157-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2A3D6818-55E8-4183-A8EC-79D3053DF4EC] (reporting strategy default)> on Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> was not selected for reporting
default	15:21:49.908462-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:49.909240-0500	RedLemon	Connection 54: enabling TLS
default	15:21:49.909308-0500	RedLemon	Connection 54: starting, TC(0x0)
default	15:21:49.909375-0500	RedLemon	[C54 5E5E2FB4-78D9-4AC2-8999-B7C02EE9E147 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{AB97FA09-F342-408C-BAA6-29999FAA2BEB}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:21:49.909472-0500	RedLemon	[C54 Hostname#e4bebcad:443 initial path ((null))] event: path:start @0.000s
default	15:21:49.909912-0500	RedLemon	[C54 Hostname#e4bebcad:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 24EDAC62-A599-4F8B-AA0A-6F33238CBE99
default	15:21:49.910669-0500	mDNSResponder	[R964] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:21:49.910217-0500	RedLemon	[C54 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:21:49.910294-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state preparing
default	15:21:49.910763-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> setting up Connection 54
default	15:21:49.912951-0500	mDNSResponder	[R964] getaddrinfo stop -- hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, client pid: 4026 (RedLemon)
default	15:21:49.913604-0500	RedLemon	nw_endpoint_resolver_update [C54 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#21f40c4c:443
default	15:21:49.913947-0500	RedLemon	[C54 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.004s
default	15:21:49.914452-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 initial path ((null))] event: path:start @0.005s
default	15:21:49.915273-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: 2002CE3C-BD01-4D15-909C-C7C1E461489D
default	15:21:49.915602-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.006s
default	15:21:49.916843-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.007s
default	15:21:49.917680-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.008s
default	15:21:49.917865-0500	RedLemon	tcp_output [C54.1:3] flags=[S] seq=2359280862, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2359280862
default	15:21:49.921185-0500	mDNSResponder	[R965] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, Addr) START PID[4026](RedLemon)
default	15:21:49.922255-0500	mDNSResponder	[R966] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, AAAA) START PID[4026](RedLemon)
default	15:21:49.922900-0500	mDNSResponder	[R965] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, Addr) STOP PID[4026](RedLemon)
default	15:21:49.922993-0500	mDNSResponder	[R966] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, AAAA) STOP PID[4026](RedLemon)
default	15:21:50.042186-0500	RedLemon	tcp_input [C54.1:3] flags=[S.] seq=3197304295, ack=2359280863, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2359280862
default	15:21:50.042407-0500	RedLemon	nw_flow_connected [C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:50.042651-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	15:21:50.042769-0500	RedLemon	[C54 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	15:21:50.043452-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C54.1:2][0x7fa206a5f3b0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:21:50.043669-0500	RedLemon	boringssl_context_info_handler(2028) [C54.1:2][0x7fa206a5f3b0] Client handshake started
default	15:21:50.044045-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS client enter_early_data
default	15:21:50.044291-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS client read_server_hello
default	15:21:50.170527-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:21:50.170695-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client read_server_hello
default	15:21:50.171366-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:21:50.172122-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:21:50.172669-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:21:50.172868-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:21:50.174022-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C54.1:2][0x7fa206a5f3b0] Performing external trust evaluation
default	15:21:50.174324-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C54.1:2][0x7fa206a5f3b0] Asyncing for external verify block
default	15:21:50.174648-0500	RedLemon	Connection 54: asked to evaluate TLS Trust
default	15:21:50.175235-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> auth completion disp=1 cred=0x0
default	15:21:50.184717-0500	RedLemon	Connection 54: TLS Trust result 0
default	15:21:50.184772-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C54.1:2][0x7fa206a5f3b0] Returning from external verify block with result: true
default	15:21:50.184828-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C54.1:2][0x7fa206a5f3b0] Certificate verification result: OK
default	15:21:50.185355-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client read_server_finished
default	15:21:50.185688-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:21:50.185715-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:21:50.185736-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:21:50.185756-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:21:50.185832-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS 1.3 client done
default	15:21:50.186316-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS client finish_client_handshake
default	15:21:50.186366-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fa206a5f3b0] Client handshake state: TLS client done
default	15:21:50.186405-0500	RedLemon	boringssl_context_info_handler(2034) [C54.1:2][0x7fa206a5f3b0] Client handshake done
default	15:21:50.187068-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C54.1:2][0x7fa206a5f3b0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(143ms) flight_time(128ms) rtt(127ms) write_stalls(0) read_stalls(6)]
default	15:21:50.187304-0500	RedLemon	nw_flow_connected [C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:50.187693-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.278s
default	15:21:50.188005-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state ready
default	15:21:50.188076-0500	RedLemon	[C54 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.278s
default	15:21:50.188208-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.278s
default	15:21:50.188294-0500	RedLemon	[C54 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.278s
default	15:21:50.188600-0500	RedLemon	Connection 54: connected successfully
default	15:21:50.188646-0500	RedLemon	Connection 54: TLS handshake complete
default	15:21:50.188867-0500	RedLemon	Connection 54: ready C(N) E(N)
default	15:21:50.189116-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> now using Connection 54
default	15:21:50.189215-0500	RedLemon	Connection 54: received viability advisory(Y)
default	15:21:50.189464-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> sent request, body N 0
default	15:21:50.281209-0500	runningboardd	Invalidating assertion 174-4026-789 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:50.315064-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> received response, status 101 content U
default	15:21:50.315396-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> response ended
default	15:21:50.315562-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> done using Connection 54
default	15:21:50.317003-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.407s
default	15:21:50.317089-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state preparing
default	15:21:50.317219-0500	RedLemon	[C54 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.407s
default	15:21:50.317493-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.408s
default	15:21:50.317610-0500	RedLemon	[C54 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.408s
default	15:21:50.317753-0500	RedLemon	nw_flow_connected [C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:21:50.318677-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-793 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:50.318011-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.408s
default	15:21:50.318125-0500	RedLemon	[C54 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.408s
default	15:21:50.319387-0500	runningboardd	Assertion 174-4026-793 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:50.318511-0500	RedLemon	nw_flow_connected [C54.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:21:50.319361-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.409s
default	15:21:50.319561-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state ready
default	15:21:50.319757-0500	RedLemon	[C54 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.410s
default	15:21:50.322191-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:50.322334-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:50.322487-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:50.322782-0500	runningboardd	Attempting to rename power assertion 33396 for target anon<RedLemon>(501) to anon<RedLemon>(501);174-4026-789:com.apple.CFNetwork.StorageDB;174-4026-793:com.apple.CFNetwork.StorageDB
default	15:21:50.441917-0500	runningboardd	Attempting to rename power assertion 33396 for target anon<RedLemon>(501) to anon<RedLemon>(501)174-4026-793:com.apple.CFNetwork.StorageDB
default	15:21:50.442014-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:50.442115-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:50.442229-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:50.444855-0500	RedLemon	tcp_input [C54.1:3] flags=[FP.] seq=3197307303, ack=2359281918, win=249 state=ESTABLISHED rcv_nxt=3197307303, snd_una=2359281918
default	15:21:50.444961-0500	RedLemon	nw_protocol_tcp_log_summary [C54.1:3]
	[BB4528E6-7427-4DA1-953F-826E2C4976F3 <private>:64926<-><private>:443]
	Init: 1, Conn_Time: 124.512ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 126.031ms, rtt_var: 2.750ms rtt_nc: 124.875ms, rtt_var_nc: 26.687ms base rtt: 124ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:21:50.446155-0500	RedLemon	nw_flow_disconnected [C54.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:21:50.446975-0500	RedLemon	Connection 54: read-side closed
default	15:21:50.447042-0500	RedLemon	Connection 54: read-side closed
default	15:21:50.447196-0500	RedLemon	Connection 54: read-side closed
default	15:21:50.447948-0500	RedLemon	[C54.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.538s, error Socket is not connected
default	15:21:50.448059-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state failed error Socket is not connected
default	15:21:50.448182-0500	RedLemon	[C54 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.538s
error	15:21:50.448312-0500	RedLemon	nw_read_request_report [C54] Receive failed with error "Socket is not connected"
error	15:21:50.448436-0500	RedLemon	nw_flow_service_reads [C54.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	15:21:50.448606-0500	RedLemon	tcp_output [C54.1:3] flags=[F.] seq=2359282049, ack=3197307328, win=2048 state=LAST_ACK rcv_nxt=3197307328, snd_una=2359281918
error	15:21:50.448800-0500	RedLemon	Connection 54: received failure notification
default	15:21:50.450079-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> summary for task success {transaction_duration_ms=542, response_status=101, connection=54, protocol="http/1.1", domain_lookup_duration_ms=4, connect_duration_ms=270, secure_connection_duration_ms=143, private_relay=false, request_start_ms=281, request_duration_ms=0, response_start_ms=406, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	15:21:50.450190-0500	RedLemon	Task <03BE6BDF-140D-41F5-ABAA-6D1A1D8EF02D>.<1> finished successfully
error	15:21:50.450310-0500	RedLemon	nw_flow_add_write_request [C54.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:21:50.450407-0500	RedLemon	nw_write_request_report [C54] Send failed with error "Socket is not connected"
default	15:21:50.450602-0500	RedLemon	Connection 54: cleaning up
default	15:21:50.450800-0500	RedLemon	[C54 5E5E2FB4-78D9-4AC2-8999-B7C02EE9E147 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:21:50.450932-0500	RedLemon	[C54 5E5E2FB4-78D9-4AC2-8999-B7C02EE9E147 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C54.1 2002CE3C-BD01-4D15-909C-C7C1E461489D 10.0.0.249:64926<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.541s, DNS @0.000s took 0.004s, TCP @0.408s took 0.125s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:21:50.451584-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state cancelled error Socket is not connected
default	15:21:50.451714-0500	RedLemon	Connection 54: done
error	15:21:50.571125-0500	RedLemon	tcp_input [C54.1:3] flags=[R] seq=3197307328, ack=0, win=0 state=LAST_ACK rcv_nxt=3197307328, snd_una=2359281918
error	15:21:50.571279-0500	RedLemon	tcp_input [C54.1:3] flags=[R] seq=3197307328, ack=0, win=0 state=CLOSED rcv_nxt=3197307328, snd_una=2359281918
error	15:21:50.571346-0500	RedLemon	tcp_input [C54.1:3] flags=[R] seq=3197307328, ack=0, win=0 state=CLOSED rcv_nxt=3197307328, snd_una=2359281918
error	15:21:50.571428-0500	RedLemon	tcp_input [C54.1:3] flags=[R] seq=3197307328, ack=0, win=0 state=CLOSED rcv_nxt=3197307328, snd_una=2359281918
error	15:21:50.571522-0500	RedLemon	tcp_input [C54.1:3] flags=[R] seq=3197307328, ack=0, win=0 state=CLOSED rcv_nxt=3197307328, snd_una=2359281918
error	15:21:50.576145-0500	RedLemon	tcp_input [C54.1:3] flags=[R] seq=3197307328, ack=0, win=0 state=CLOSED rcv_nxt=3197307328, snd_una=2359281918
default	15:21:51.113745-0500	RedLemon	Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:51.114694-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [32E31561-BA07-47DC-B9C8-6EC8C8178ACC] (reporting strategy default)> on Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> was not selected for reporting
default	15:21:51.116779-0500	RedLemon	Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:51.117208-0500	RedLemon	Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> now using Connection 2
default	15:21:51.118557-0500	RedLemon	0x7fa2065e1668 ID=380 Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> sent request, body N 0
default	15:21:51.133524-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:21:51.177890-0500	RedLemon	0x7fa2065e1668 ID=380 Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> received response, status 200 content K
default	15:21:51.179019-0500	RedLemon	Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> response ended
default	15:21:51.179528-0500	RedLemon	Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> done using Connection 2
default	15:21:51.179960-0500	RedLemon	Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> summary for task success {transaction_duration_ms=63, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=61, response_duration_ms=2, request_bytes=529, response_bytes=662, cache_hit=false}
default	15:21:51.180687-0500	RedLemon	Task <3C16AE0D-5C41-44CB-ACF5-EBBD121DBA21>.<171> finished successfully
default	15:21:51.272080-0500	mDNSResponder	[R967] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, Addr) START PID[4026](RedLemon)
default	15:21:51.272866-0500	mDNSResponder	[R968] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, AAAA) START PID[4026](RedLemon)
default	15:21:51.273516-0500	mDNSResponder	[R967] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, Addr) STOP PID[4026](RedLemon)
default	15:21:51.273619-0500	mDNSResponder	[R968] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, AAAA) STOP PID[4026](RedLemon)
default	15:21:51.325472-0500	runningboardd	Invalidating assertion 174-4026-793 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:51.500355-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:51.500507-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:51.500602-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:51.502652-0500	runningboardd	Invalidating assertion 174-114-791 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:51.639775-0500	RedLemon	🔍 MPV track-list/count: 2
default	15:21:51.640014-0500	RedLemon	🔍 Track 0 type: sub
default	15:21:51.640266-0500	RedLemon	✅ Found subtitle track: ID=1, lang=en, title=Frankenstein (2025) eng
default	15:21:51.640507-0500	RedLemon	🔍 Track 1 type: sub
default	15:21:51.640749-0500	RedLemon	✅ Found subtitle track: ID=2, lang=en, title=Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:21:51.640949-0500	RedLemon	📊 Total subtitle tracks found: 3 (including Off if needed)
default	15:21:51.641340-0500	RedLemon	🔍 MPV track-list/count: 0
default	15:21:51.641544-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	15:21:51.651920-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:51.652028-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:51.652265-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:51.931608-0500	RedLemon	                AUHAL.cpp:386   AUHAL: (0x7fa2025dd240) Listening to HAL system property 1682929012
default	15:21:51.931840-0500	RedLemon	                AUHAL.cpp:397   AUHAL: (0x7fa2025dd240) Selecting device 49 from constructor
default	15:21:51.931893-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fa2025dd240)
default	15:21:51.931935-0500	RedLemon	                AUHAL.cpp:627   SelectDevice: (0x7fa2025dd240) not already running
default	15:21:51.931973-0500	RedLemon	                AUHAL.cpp:702   SelectDevice: (0x7fa2025dd240) nothing to teardown
default	15:21:51.932009-0500	RedLemon	                AUHAL.cpp:706   SelectDevice: (0x7fa2025dd240) connecting device 49
default	15:21:51.933319-0500	RedLemon	                AUHAL.cpp:3107  IsDeviceUsable: (0x7fa2025dd240) Device ID: 49 (Input:No | Output:Yes): true
default	15:21:51.933717-0500	RedLemon	                AUHAL.cpp:716   SelectDevice: (0x7fa2025dd240) created ioproc 0xb for device 49
default	15:21:51.933787-0500	RedLemon	                AUHAL.cpp:1452  UpdateStreamFormats: -> (0x7fa2025dd240)
default	15:21:51.934006-0500	RedLemon	                AUHAL.cpp:1516  UpdateStreamFormats:
  output stream 0 [0x32]:  2 ch,  44100 Hz, Float32, interleaved
default	15:21:51.934060-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 1 output streams; not all mono
default	15:21:51.934099-0500	RedLemon	                AUHAL.cpp:1537  UpdateStreamFormats:
  Output render format:  2 ch,  44100 Hz, Float32, interleaved
default	15:21:51.934139-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 0 input streams; not all mono
default	15:21:51.934376-0500	RedLemon	                AUHAL.cpp:1602  UpdateStreamFormats: AUHAL(0x7fa2025dd240) Calling PropertyChanged() for kAudioUnitProperty_StreamFormat, Scope:Output, Bus:Output
default	15:21:51.934427-0500	RedLemon	                AUHAL.cpp:1615  UpdateStreamFormats: <-
default	15:21:51.934681-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fa2025dd240) removing 0 device listeners from device 0
default	15:21:51.934730-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fa2025dd240) adding 6 device listeners to device 49
default	15:21:51.935691-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fa2025dd240) removing 0 device delegate listeners from device 0
default	15:21:51.935807-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fa2025dd240) adding 0 device delegate listeners to device 49
default	15:21:51.935852-0500	RedLemon	                AUHAL.cpp:842   SelectDevice: <- (0x7fa2025dd240)
default	15:21:51.937169-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	15:21:51.938114-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	15:21:51.938486-0500	RedLemon	                AUHAL.cpp:2060  SetProperty: (0x7fa2025dd240) caller requesting device change from 49 to 49
default	15:21:51.938678-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fa2025dd240)
default	15:21:51.938812-0500	RedLemon	                AUHAL.cpp:613   SelectDevice: <- (0x7fa2025dd240) exiting with nothing to do
default	15:21:52.174732-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: NO
default	15:21:52.175034-0500	RedLemon	⏱️ Watch Party: Duration available (9145.8s), triggering ready signal
default	15:21:52.175149-0500	RedLemon	👋 Watch Party: Sending READY signal
default	15:21:52.219222-0500	mDNSResponder	[R969] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, Addr) START PID[4026](RedLemon)
default	15:21:52.224683-0500	mDNSResponder	[R970] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'GV1XzOlf7lnCVyq8K1SV1g=='>, AAAA) START PID[4026](RedLemon)
default	15:21:52.235357-0500	mDNSResponder	[R969] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, Addr) STOP PID[4026](RedLemon)
default	15:21:52.235461-0500	mDNSResponder	[R970] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8I0jtwkaoMyRual5UiNvMg=='>, AAAA) STOP PID[4026](RedLemon)
default	15:21:52.279642-0500	RedLemon	✅ Watch Party: READY signal sent successfully
default	15:21:52.282329-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: YES
default	15:21:53.113055-0500	RedLemon	Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:53.113982-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B42512C2-4DC2-4886-BD4E-C479508290D5] (reporting strategy default)> on Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> was not selected for reporting
default	15:21:53.116080-0500	RedLemon	Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:53.116554-0500	RedLemon	Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> now using Connection 2
default	15:21:53.118278-0500	RedLemon	0x7fa20bcd28f8 ID=384 Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> sent request, body N 0
default	15:21:53.142162-0500	RedLemon	🔍 MPV track-list/count: 0
default	15:21:53.142391-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	15:21:53.173374-0500	RedLemon	tcp_input [C49.1.1:3] flags=[FP.] seq=1363383189, ack=4260420934, win=501 state=ESTABLISHED rcv_nxt=1363383189, snd_una=4260420934
default	15:21:53.173522-0500	RedLemon	nw_protocol_tcp_log_summary [C49.1.1:3]
	[4446F16F-BBD3-4B63-B201-5AD2944E2FA5 <private>:64924<-><private>:443]
	Init: 1, Conn_Time: 126.461ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 0
	rtt_cache: none, rtt_upd: 11, rtt: 126.687ms, rtt_var: 16.687ms rtt_nc: 126.687ms, rtt_var_nc: 16.687ms base rtt: 100ms
	ACKs-compressed: 0, ACKs delayed: 1 delayed ACKs sent: 0
default	15:21:53.174252-0500	RedLemon	Connection 49: read-side closed
default	15:21:53.174313-0500	RedLemon	Connection 49: read-side closed
default	15:21:53.174514-0500	RedLemon	Connection 49: read-side closed
default	15:21:53.174834-0500	RedLemon	Connection 49: cleaning up
default	15:21:53.174935-0500	RedLemon	[C49 3B35D7BA-1A9A-4E38-A86E-A4BDE0821169 Hostname#13203cde:443 quic-connection, url hash: 9d73bcd8, definite, attribution: developer] cancel
default	15:21:53.175123-0500	RedLemon	[C49 3B35D7BA-1A9A-4E38-A86E-A4BDE0821169 Hostname#13203cde:443 quic-connection, url hash: 9d73bcd8, definite, attribution: developer] cancelled
	[C49.1.1 9BBFBF68-A907-4355-8F46-DB62120E1B72 10.0.0.249:64924<->IPv4#314b8c2e:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 8.250s, DNS @0.001s took 0.038s, TCP @0.058s took 0.127s, TLS 1.3 took 0.148s
	bytes in/out: 8978/3207, packets in/out: 28/33, rtt: 0.126s, retransmitted bytes: 575, out-of-order bytes: 0
default	15:21:53.176266-0500	RedLemon	nw_flow_disconnected [C49.1.1 IPv4#314b8c2e:443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:21:53.176932-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state cancelled
default	15:21:53.177042-0500	RedLemon	tcp_output [C49.1.1:3] flags=[FP.] seq=4260420973, ack=1363383214, win=4096 state=LAST_ACK rcv_nxt=1363383214, snd_una=4260420934
default	15:21:53.185039-0500	RedLemon	0x7fa20bcd28f8 ID=384 Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> received response, status 200 content K
default	15:21:53.186063-0500	RedLemon	Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> response ended
default	15:21:53.186599-0500	RedLemon	Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> done using Connection 2
default	15:21:53.186831-0500	RedLemon	Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> summary for task success {transaction_duration_ms=71, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=69, response_duration_ms=2, request_bytes=529, response_bytes=662, cache_hit=true}
default	15:21:53.187123-0500	RedLemon	Task <DEC29EDB-A726-4F5C-93FB-D051D5B7366B>.<172> finished successfully
default	15:21:53.188065-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-794 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:53.188252-0500	runningboardd	Assertion 174-4026-794 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:53.188958-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:53.189006-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:53.189052-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:53.192025-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-795 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:53.192178-0500	runningboardd	Assertion 174-114-795 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:53.193258-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:53.193306-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:53.193401-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
error	15:21:53.283925-0500	RedLemon	tcp_input [C49.1.1:3] flags=[R.] seq=1363383214, ack=4260420973, win=501 state=LAST_ACK rcv_nxt=1363383214, snd_una=4260420934
error	15:21:53.287430-0500	RedLemon	tcp_input [C49.1.1:3] flags=[R] seq=1363383214, ack=0, win=0 state=CLOSED rcv_nxt=1363383214, snd_una=4260420934
error	15:21:53.288363-0500	RedLemon	tcp_input [C49.1.1:3] flags=[R] seq=1363383214, ack=0, win=0 state=CLOSED rcv_nxt=1363383214, snd_una=4260420934
default	15:21:54.194510-0500	runningboardd	Invalidating assertion 174-4026-794 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:54.367554-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:54.367705-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:54.367870-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:54.370812-0500	runningboardd	Invalidating assertion 174-114-795 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:54.542660-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:54.542754-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:54.542843-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:54.642946-0500	RedLemon	🔍 MPV track-list/count: 0
default	15:21:54.643233-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	15:21:55.113683-0500	RedLemon	Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:55.114439-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [671BDA53-5ABE-40F8-A342-80886B5E352F] (reporting strategy default)> on Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> was not selected for reporting
default	15:21:55.115775-0500	RedLemon	Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:55.116195-0500	RedLemon	Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> now using Connection 2
default	15:21:55.117834-0500	RedLemon	0x7fa20293a938 ID=388 Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> sent request, body N 0
default	15:21:55.139847-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:21:55.185051-0500	RedLemon	0x7fa20293a938 ID=388 Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> received response, status 200 content K
default	15:21:55.185887-0500	RedLemon	Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> response ended
default	15:21:55.186400-0500	RedLemon	Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> done using Connection 2
default	15:21:55.186841-0500	RedLemon	Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> summary for task success {transaction_duration_ms=71, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=69, response_duration_ms=1, request_bytes=529, response_bytes=662, cache_hit=true}
default	15:21:55.187621-0500	RedLemon	Task <A174B859-F8B4-4EE3-9E5E-688BE53A9D2E>.<173> finished successfully
default	15:21:55.189135-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-796 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:55.189588-0500	runningboardd	Assertion 174-4026-796 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:55.191263-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:55.191452-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:55.191632-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:55.194904-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-797 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:55.195153-0500	runningboardd	Assertion 174-114-797 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:55.196809-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:55.196876-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:55.196995-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:56.197459-0500	runningboardd	Invalidating assertion 174-4026-796 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:56.370191-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:56.370289-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:56.370385-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:56.373065-0500	runningboardd	Invalidating assertion 174-114-797 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:56.525042-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:56.525161-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:56.525527-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:57.113266-0500	RedLemon	Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:57.114218-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9F9CED84-6A57-4535-8AEA-BF32E83FEE1D] (reporting strategy default)> on Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> was not selected for reporting
default	15:21:57.115873-0500	RedLemon	Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:57.116251-0500	RedLemon	Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> now using Connection 2
default	15:21:57.117893-0500	RedLemon	0x7fa205a732a8 ID=392 Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> sent request, body N 0
default	15:21:57.131237-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:21:57.175801-0500	RedLemon	0x7fa205a732a8 ID=392 Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> received response, status 200 content K
default	15:21:57.176907-0500	RedLemon	Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> response ended
default	15:21:57.177516-0500	RedLemon	Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> done using Connection 2
default	15:21:57.177968-0500	RedLemon	Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> summary for task success {transaction_duration_ms=63, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=60, response_duration_ms=2, request_bytes=529, response_bytes=663, cache_hit=false}
default	15:21:57.179841-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-798 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:57.178800-0500	RedLemon	Task <F554ECEA-9181-4796-B3ED-63966031F658>.<174> finished successfully
default	15:21:57.180218-0500	runningboardd	Assertion 174-4026-798 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:57.181670-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:57.181760-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:57.181852-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:57.186249-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-799 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:57.186594-0500	runningboardd	Assertion 174-114-799 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:57.187582-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:57.187647-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:57.187709-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:58.186326-0500	runningboardd	Invalidating assertion 174-4026-798 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:21:58.334393-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:58.334548-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:58.334892-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:58.337752-0500	runningboardd	Invalidating assertion 174-114-799 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:21:58.512320-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:58.512420-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:58.512659-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:58.729391-0500	RedLemon	Task <B21CDD24-D3F5-4F6D-A43F-896E3AAC51C5>.<175> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:21:58.729773-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CBC7F223-82EF-4624-BC06-A21930771122] (reporting strategy default)> on Task <B21CDD24-D3F5-4F6D-A43F-896E3AAC51C5>.<175> was not selected for reporting
default	15:21:58.733426-0500	RedLemon	Task <B21CDD24-D3F5-4F6D-A43F-896E3AAC51C5>.<175> summary for task success {transaction_duration_ms=3, response_status=200, cache_hit=true}
default	15:21:58.733553-0500	RedLemon	Task <B21CDD24-D3F5-4F6D-A43F-896E3AAC51C5>.<175> finished successfully
default	15:21:59.113775-0500	RedLemon	Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:21:59.114711-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F9B44CE5-1954-46F2-8550-89261B7ECAD6] (reporting strategy default)> on Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> was not selected for reporting
default	15:21:59.115989-0500	RedLemon	Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:21:59.116631-0500	RedLemon	Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> now using Connection 2
default	15:21:59.117753-0500	RedLemon	0x7fa20bc26338 ID=396 Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> sent request, body N 0
default	15:21:59.129092-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:21:59.184756-0500	RedLemon	0x7fa20bc26338 ID=396 Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> received response, status 200 content K
default	15:21:59.185590-0500	RedLemon	Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> response ended
default	15:21:59.186424-0500	RedLemon	Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> done using Connection 2
default	15:21:59.186930-0500	RedLemon	Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> summary for task success {transaction_duration_ms=71, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=69, response_duration_ms=2, request_bytes=529, response_bytes=663, cache_hit=false}
default	15:21:59.188210-0500	RedLemon	Task <5EF788A4-FFA0-4033-9035-E0BB48BCBFBB>.<176> finished successfully
default	15:21:59.190047-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-800 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:59.190819-0500	runningboardd	Assertion 174-4026-800 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:21:59.193953-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:59.194082-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:59.194155-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:59.198128-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-801 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:21:59.198311-0500	runningboardd	Assertion 174-114-801 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:21:59.200227-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:21:59.200279-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:21:59.200330-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:21:59.222328-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:22:00.200545-0500	runningboardd	Invalidating assertion 174-4026-800 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:22:00.369712-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:00.369801-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:00.369891-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:00.375436-0500	runningboardd	Invalidating assertion 174-114-801 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:22:00.525502-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:00.525598-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:00.525686-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:00.824728-0500	runningboardd	Invalidating assertion 174-140-771 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.coreservices.launchservicesd>:140]
default	15:22:01.032886-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:01.033281-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:01.036601-0500	runningboardd	[anon<RedLemon>(501):4026] Set darwin role to: UserInteractiveNonFocal
default	15:22:01.038562-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:01.095690-0500	runningboardd	Invalidating assertion 174-171-792 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	15:22:01.112747-0500	RedLemon	Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:22:01.113291-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DAD3E8BE-7A65-4284-8D8C-D73B20014BB8] (reporting strategy default)> on Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> was not selected for reporting
default	15:22:01.114309-0500	RedLemon	Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:22:01.114837-0500	RedLemon	Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> now using Connection 2
default	15:22:01.118897-0500	RedLemon	0x7fa205df2e58 ID=400 Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> sent request, body N 0
default	15:22:01.137496-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:01.137949-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:01.138741-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:01.173626-0500	RedLemon	0x7fa205df2e58 ID=400 Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> received response, status 200 content K
default	15:22:01.174248-0500	RedLemon	Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> response ended
default	15:22:01.174648-0500	RedLemon	Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> done using Connection 2
default	15:22:01.174930-0500	RedLemon	Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> summary for task success {transaction_duration_ms=61, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=4, response_start_ms=59, response_duration_ms=1, request_bytes=529, response_bytes=663, cache_hit=false}
default	15:22:01.175604-0500	RedLemon	Task <BF18C910-6E5F-4511-A581-D2CBEBEA13D8>.<177> finished successfully
default	15:22:01.191936-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-818 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:22:01.193099-0500	runningboardd	Assertion 174-4026-818 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:22:01.216234-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:22:01.219537-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:01.219587-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:01.219630-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:01.255688-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-819 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:22:01.255876-0500	runningboardd	Assertion 174-114-819 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:22:01.260278-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:01.260349-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:01.260402-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:02.314014-0500	runningboardd	Invalidating assertion 174-4026-818 (target:[anon<RedLemon>(501):4026]) from originator [anon<RedLemon>(501):4026]
default	15:22:02.422255-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:02.422314-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:02.422374-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:02.430553-0500	runningboardd	Invalidating assertion 174-114-819 (target:[anon<RedLemon>(501):4026]) from originator [daemon<com.apple.powerd>:114]
default	15:22:02.602365-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:02.602473-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:02.602526-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:02.800404-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:22:02.801023-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F4EF4483-EB38-4DF7-8E88-A2FA6BCE4786] (reporting strategy default)> on Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> was not selected for reporting
default	15:22:02.801784-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:22:02.802520-0500	RedLemon	Connection 55: enabling TLS
default	15:22:02.802546-0500	RedLemon	Connection 55: starting, TC(0x0)
default	15:22:02.802578-0500	RedLemon	[C55 29A90B6D-211B-458D-AFA8-CCB99B538326 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{372826E1-03DC-49CE-BD77-4F7DF10FE00E}{(null)}{Y}{2} (private), proc: D21B07A6-FB45-3B3F-A8D0-302C4D1218E6] start
default	15:22:02.802639-0500	RedLemon	[C55 Hostname#e4bebcad:443 initial path ((null))] event: path:start @0.000s
default	15:22:02.802891-0500	RedLemon	[C55 Hostname#e4bebcad:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 7243760D-B795-4FDD-A7FC-A5A64C87DAA1
default	15:22:02.803221-0500	mDNSResponder	[R973] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, options: 0x8 {use-failover}, client pid: 4026 (RedLemon)
default	15:22:02.803018-0500	RedLemon	[C55 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:22:02.803041-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C55] reporting state preparing
default	15:22:02.803245-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> setting up Connection 55
default	15:22:02.804860-0500	mDNSResponder	[R973] getaddrinfo stop -- hostname: <mask.hash: 'rXiO7DJwjRvk4DH7ZLNDWA=='>, client pid: 4026 (RedLemon)
default	15:22:02.804744-0500	RedLemon	nw_endpoint_resolver_update [C55 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#21f40c4c:443
default	15:22:02.804857-0500	RedLemon	[C55 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	15:22:02.805686-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 initial path ((null))] event: path:start @0.003s
default	15:22:02.807301-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.004s, uuid: 7E291C84-6187-470E-8532-7D15F51A513F
default	15:22:02.807734-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.005s
default	15:22:02.809216-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.006s
default	15:22:02.810266-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.007s
default	15:22:02.811412-0500	RedLemon	tcp_output [C55.1:3] flags=[S] seq=2987935532, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2987935532
default	15:22:02.931333-0500	RedLemon	tcp_input [C55.1:3] flags=[S.] seq=2980061341, ack=2987935533, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2987935532
default	15:22:02.931602-0500	RedLemon	nw_flow_connected [C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:22:02.931852-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.129s
default	15:22:02.931953-0500	RedLemon	[C55 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.129s
default	15:22:02.937314-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C55.1:2][0x7fa20654dea0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:22:02.937509-0500	RedLemon	boringssl_context_info_handler(2028) [C55.1:2][0x7fa20654dea0] Client handshake started
default	15:22:02.939429-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS client enter_early_data
default	15:22:02.939589-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS client read_server_hello
default	15:22:03.072345-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:22:03.072442-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client read_server_hello
default	15:22:03.074867-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:22:03.076507-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:22:03.079521-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:22:03.079628-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:22:03.080193-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C55.1:2][0x7fa20654dea0] Performing external trust evaluation
default	15:22:03.080341-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C55.1:2][0x7fa20654dea0] Asyncing for external verify block
default	15:22:03.080594-0500	RedLemon	Connection 55: asked to evaluate TLS Trust
default	15:22:03.081036-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> auth completion disp=1 cred=0x0
default	15:22:03.092854-0500	RedLemon	Connection 55: TLS Trust result 0
default	15:22:03.094069-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C55.1:2][0x7fa20654dea0] Returning from external verify block with result: true
default	15:22:03.094435-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C55.1:2][0x7fa20654dea0] Certificate verification result: OK
default	15:22:03.095182-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client read_server_finished
default	15:22:03.095690-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:22:03.095732-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:22:03.095784-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:22:03.095880-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:22:03.096028-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS 1.3 client done
default	15:22:03.096204-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS client finish_client_handshake
default	15:22:03.096288-0500	RedLemon	boringssl_context_info_handler(2045) [C55.1:2][0x7fa20654dea0] Client handshake state: TLS client done
default	15:22:03.096326-0500	RedLemon	boringssl_context_info_handler(2034) [C55.1:2][0x7fa20654dea0] Client handshake done
default	15:22:03.097431-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C55.1:2][0x7fa20654dea0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(160ms) flight_time(138ms) rtt(134ms) write_stalls(0) read_stalls(7)]
default	15:22:03.097851-0500	RedLemon	nw_flow_connected [C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:22:03.098741-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.296s
default	15:22:03.104578-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C55] reporting state ready
default	15:22:03.104706-0500	RedLemon	[C55 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.302s
default	15:22:03.104927-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.302s
default	15:22:03.105003-0500	RedLemon	[C55 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.302s
default	15:22:03.105401-0500	RedLemon	Connection 55: connected successfully
default	15:22:03.105479-0500	RedLemon	Connection 55: TLS handshake complete
default	15:22:03.105724-0500	RedLemon	Connection 55: ready C(N) E(N)
default	15:22:03.105993-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> now using Connection 55
default	15:22:03.106112-0500	RedLemon	Connection 55: received viability advisory(Y)
default	15:22:03.106365-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> sent request, body N 0
default	15:22:03.113440-0500	RedLemon	Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:22:03.113853-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [21C2924F-602C-4D1F-B972-3BA28801D117] (reporting strategy default)> on Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> was not selected for reporting
default	15:22:03.115797-0500	RedLemon	Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:22:03.116121-0500	RedLemon	Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> now using Connection 2
default	15:22:03.119680-0500	RedLemon	0x7fa206e6e5e8 ID=404 Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> sent request, body N 0
default	15:22:03.176956-0500	RedLemon	0x7fa206e6e5e8 ID=404 Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> received response, status 200 content K
default	15:22:03.177700-0500	RedLemon	Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> response ended
default	15:22:03.178138-0500	RedLemon	Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> done using Connection 2
default	15:22:03.178328-0500	RedLemon	Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> summary for task success {transaction_duration_ms=64, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=3, response_start_ms=62, response_duration_ms=1, request_bytes=529, response_bytes=663, cache_hit=false}
default	15:22:03.178683-0500	RedLemon	Task <B70798EA-9495-4FA5-9435-3B43F4C6CFBC>.<178> finished successfully
default	15:22:03.180620-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [anon<RedLemon>(501):4026] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-4026-820 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:22:03.180901-0500	runningboardd	Assertion 174-4026-820 (target:[anon<RedLemon>(501):4026]) will be created as active as no start-time-defining assertions exist
default	15:22:03.185045-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:03.185105-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:03.185158-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:03.189208-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	15:22:03.188978-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4026] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-821 target:4026 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:22:03.192306-0500	runningboardd	Assertion 174-114-821 (target:[anon<RedLemon>(501):4026]) will be created as active
default	15:22:03.194967-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring jetsam update because this process is not memory-managed
default	15:22:03.195019-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring suspend because this process is not lifecycle managed
default	15:22:03.195343-0500	runningboardd	[anon<RedLemon>(501):4026] Ignoring GPU update because this process is not GPU managed
default	15:22:03.282615-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> received response, status 101 content U
default	15:22:03.282881-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> response ended
default	15:22:03.282964-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> done using Connection 55
default	15:22:03.284069-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.481s
default	15:22:03.284109-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C55] reporting state preparing
default	15:22:03.284151-0500	RedLemon	[C55 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.481s
default	15:22:03.284236-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.481s
default	15:22:03.284276-0500	RedLemon	[C55 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.481s
default	15:22:03.284388-0500	RedLemon	nw_flow_connected [C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:22:03.284545-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.481s
default	15:22:03.284605-0500	RedLemon	[C55 Hostname#e4bebcad:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.481s
default	15:22:03.284725-0500	RedLemon	nw_flow_connected [C55.1 IPv4#21f40c4c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-13452893)
default	15:22:03.285003-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.482s
default	15:22:03.285043-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C55] reporting state ready
default	15:22:03.285147-0500	RedLemon	[C55 Hostname#e4bebcad:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.482s
default	15:22:03.411276-0500	RedLemon	nw_flow_disconnected [C55.1 IPv4#21f40c4c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:22:03.411549-0500	RedLemon	nw_protocol_tcp_log_summary [C55.1:3]
	[4D40394E-D540-4776-A035-F66AF87B07C5 <private>:64927<-><private>:443]
	Init: 1, Conn_Time: 120.170ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 131.718ms, rtt_var: 18.375ms rtt_nc: 128.000ms, rtt_var_nc: 42.250ms base rtt: 117ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:22:03.412184-0500	RedLemon	[C55.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.609s, error Socket is not connected
default	15:22:03.412214-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C55] reporting state failed error Socket is not connected
default	15:22:03.412286-0500	RedLemon	[C55 Hostname#e4bebcad:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.609s
error	15:22:03.412333-0500	RedLemon	nw_read_request_report [C55] Receive failed with error "Socket is not connected"
error	15:22:03.412374-0500	RedLemon	nw_flow_service_reads [C55.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	15:22:03.412420-0500	RedLemon	tcp_output [C55.1:3] flags=[F.] seq=2987936718, ack=2980064348, win=2048 state=FIN_WAIT_1 rcv_nxt=2980064348, snd_una=2987936587
error	15:22:03.412491-0500	RedLemon	Connection 55: received failure notification
default	15:22:03.412662-0500	RedLemon	tcp_input [C55.1:3] flags=[F.] seq=2980064372, ack=2987936587, win=249 state=CLOSED rcv_nxt=2980064348, snd_una=2987936587
default	15:22:03.412893-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> summary for task success {transaction_duration_ms=611, response_status=101, connection=55, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=289, secure_connection_duration_ms=160, private_relay=false, request_start_ms=304, request_duration_ms=0, response_start_ms=480, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	15:22:03.413126-0500	RedLemon	Task <D0837628-3BB0-42CD-AB77-3F8BF21373B1>.<1> finished successfully
error	15:22:03.413145-0500	RedLemon	nw_flow_add_write_request [C55.1 IPv4#21f40c4c:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:22:03.413218-0500	RedLemon	nw_write_request_report [C55] Send failed with error "Socket is not connected"
default	15:22:03.413278-0500	RedLemon	Connection 55: cleaning up
default	15:22:03.413357-0500	RedLemon	[C55 29A90B6D-211B-458D-AFA8-CCB99B538326 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancel
default	15:22:03.413655-0500	RedLemon	[C55 29A90B6D-211B-458D-AFA8-CCB99B538326 Hostname#e4bebcad:443 tcp, url hash: b907ef4e, tls, definite, attribution: developer] cancelled
	[C55.1 7E291C84-6187-470E-8532-7D15F51A513F 10.0.0.249:64927<->IPv4#21f40c4c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.610s, DNS @0.000s took 0.002s, TCP @0.481s took 0.122s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:22:03.414434-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C55] reporting state cancelled error Socket is not connected
default	15:22:03.414578-0500	RedLemon	Connection 55: done
error	15:22:03.530384-0500	RedLemon	tcp_input [C55.1:3] flags=[R] seq=2980064348, ack=0, win=0 state=CLOSED rcv_nxt=2980064348, snd_una=2987936587
error	15:22:03.530668-0500	RedLemon	tcp_input [C55.1:3] flags=[R] seq=2980064348, ack=0, win=0 state=CLOSED rcv_nxt=2980064348, snd_una=2987936587
error	15:22:03.530713-0500	RedLemon	tcp_input [C55.1:3] flags=[R] seq=2980064348, ack=0, win=0 state=CLOSED rcv_nxt=2980064348, snd_una=2987936587
error	15:22:03.538053-0500	RedLemon	tcp_input [C55.1:3] flags=[R] seq=2980064348, ack=0, win=0 state=CLOSED rcv_nxt=2980064348, snd_una=2987936587
error	15:22:03.538327-0500	RedLemon	tcp_input [C55.1:3] flags=[R] seq=2980064348, ack=0, win=0 state=CLOSED rcv_nxt=2980064348, snd_una=2987936587
error	15:22:03.539462-0500	RedLemon	tcp_input [C55.1:3] flags=[R] seq=2980064348, ack=0, win=0 state=CLOSED rcv_nxt=2980064348, snd_una=2987936587
default	15:22:04.279848-0500	RedLemon	tcp_input [C41.1.1:3] flags=[F.] seq=2582986842, ack=769669381, win=8 state=ESTABLISHED rcv_nxt=2582986842, snd_una=769669381
default	15:22:04.279989-0500	RedLemon	nw_protocol_tcp_log_summary [C41.1.1:3]
	[573C03ED-257F-4CC4-B191-8386EFE41024 <private>:60041<-><private>:443]
	Init: 1, Conn_Time: 16.224ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 9, rtt: 43.343ms, rtt_var: 50.187ms rtt_nc: 41.000ms, rtt_var_nc: 48.750ms base rtt: 7ms
	ACKs-compressed: 0, ACKs delayed: 26 delayed ACKs sent: 0
