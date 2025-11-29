default	16:46:13.362112-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "frontmost:10341" ID:166-129-2541 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	16:46:13.362301-0500	runningboardd	Assertion 166-129-2541 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:13.368371-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:13.375487-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:13.379861-0500	runningboardd	[anon<RedLemon>(501):10341] Set darwin role to: UserInteractiveFocal
default	16:46:13.380187-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:13.388550-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "notification:10341" ID:166-129-2542 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	16:46:13.389180-0500	runningboardd	Assertion 166-129-2542 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:13.394221-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:13.394707-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:13.394767-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:14.963867-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:14.964281-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1AA98C47-67E4-40FA-B862-20AFE9F31BF3] (reporting strategy default)> on Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> was not selected for reporting
default	16:46:14.964975-0500	RedLemon	Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:14.965255-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:14.966265-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [22B12428-1088-4D91-A7F6-B3D326D1B25F] (reporting strategy default)> on Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> was not selected for reporting
default	16:46:14.967303-0500	RedLemon	Connection 16: enabling TLS
default	16:46:14.967494-0500	RedLemon	Connection 16: starting, TC(0x0)
default	16:46:14.967549-0500	RedLemon	[C16 FF258A6A-8A19-462C-9A9B-ED763CAFF267 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{7F017F9D-4D94-4C09-BAF5-B8695656583C}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:14.967746-0500	RedLemon	[C16 Hostname#6d693a93:443 initial path ((null))] event: path:start @0.000s
default	16:46:14.968164-0500	RedLemon	[C16 Hostname#6d693a93:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 9CA6D36D-6080-45E9-A586-0B532E494C86
default	16:46:14.968503-0500	RedLemon	[C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:14.968590-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state preparing
default	16:46:14.968864-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> setting up Connection 16
default	16:46:14.969218-0500	RedLemon	Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:14.970061-0500	RedLemon	Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> now using Connection 3
default	16:46:14.974451-0500	RedLemon	Task <A46E1CE1-A2F3-4D85-95DC-B6500E1A3E79>.<1> summary for task success {transaction_duration_ms=8803, response_status=101, connection=9, protocol="http/1.1", domain_lookup_duration_ms=1, connect_duration_ms=47, secure_connection_duration_ms=28, private_relay=false, request_start_ms=49, request_duration_ms=0, response_start_ms=210, response_duration_ms=0, request_bytes=828, response_bytes=850, cache_hit=false}
default	16:46:14.974514-0500	RedLemon	Task <A46E1CE1-A2F3-4D85-95DC-B6500E1A3E79>.<1> finished successfully
default	16:46:14.975141-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:14.975892-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [25978D70-CE67-4E9B-BB6A-24915FE0E977] (reporting strategy default)> on Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> was not selected for reporting
default	16:46:14.975934-0500	RedLemon	Connection 9: cleaning up
default	16:46:14.976511-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:14.976571-0500	RedLemon	[C9 70CCFC00-F3B5-4E47-8130-ADE769455B99 Hostname#3e78bf88:443 tcp, url hash: fb28feca, tls, definite, attribution: developer] cancel
default	16:46:14.977147-0500	RedLemon	[C9 70CCFC00-F3B5-4E47-8130-ADE769455B99 Hostname#3e78bf88:443 tcp, url hash: fb28feca, tls, definite, attribution: developer] cancelled
	[C9.1 B6A95C55-D748-4C6E-A380-AAF95E11572E 10.0.0.113:57950<->IPv4#90b4c047:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 8.805s, DNS @0.000s took 0.001s, TCP @0.210s took 0.018s, TLS 1.3 took 0.000s
	bytes in/out: 5122/1734, packets in/out: 10/13, rtt: 0.021s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:14.977267-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [89B274E3-A3A7-48FD-85B2-272E53DE52EE] (reporting strategy default)> on Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> was not selected for reporting
default	16:46:14.979368-0500	RedLemon	nw_flow_disconnected [C9.1 IPv4#90b4c047:443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:46:14.980206-0500	RedLemon	nw_protocol_tcp_log_summary [C9.1:3] 
	[48CB83F2-6167-4194-B9FB-B3FC09E62ED6 <private>:57950<-><private>:443]
	Init: 1, Conn_Time: 18.303ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 21.843ms, rtt_var: 10.687ms rtt_nc: 22.906ms, rtt_var_nc: 13.687ms base rtt: 15ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:14.981365-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C9] reporting state cancelled
default	16:46:14.982014-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:14.982410-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:14.971581-0500	mDNSResponder	[R3295] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:14.985910-0500	RedLemon	tcp_output [C9.1:3] flags=[F.] seq=4031743487, ack=2363102227, win=2048 state=FIN_WAIT_1 rcv_nxt=2363102227, snd_una=4031743433
default	16:46:14.986181-0500	RedLemon	Connection 9: done
error	16:46:14.986354-0500	RedLemon	Read completed with an error <private>
default	16:46:14.987555-0500	RedLemon	0x7f7b9c8dec28 ID=272 Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> sent request, body S 83
default	16:46:14.987724-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:46:14.988121-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> waiting for setup of Connection 17
default	16:46:14.988163-0500	RedLemon	Connection 17: enabling TLS
default	16:46:14.988194-0500	RedLemon	Connection 17: starting, TC(0x0)
default	16:46:14.988241-0500	RedLemon	[C17 5152C165-C3C9-4888-8DCD-91ADFF74DBBE Hostname#853c3608:443 quic-connection, url hash: 1728aed7, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:14.988317-0500	RedLemon	[C17 Hostname#853c3608:443 initial path ((null))] event: path:start @0.000s
default	16:46:14.988673-0500	RedLemon	[C17 Hostname#853c3608:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: E3359108-6A73-4349-B6FA-A82D5FC89811
default	16:46:14.988955-0500	RedLemon	[C17 Hostname#853c3608:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	16:46:14.989032-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C17] reporting state preparing
default	16:46:14.989474-0500	RedLemon	[C17.1 Hostname#853c3608:443 initial path ((null))] event: path:start @0.001s
default	16:46:14.990277-0500	RedLemon	[C17.1 Hostname#853c3608:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 1D44C878-1BBA-42A8-9BAE-B555F6DF283C
default	16:46:14.990508-0500	RedLemon	[C17.1 Hostname#853c3608:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.002s
default	16:46:14.990895-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> setting up Connection 17
default	16:46:14.991676-0500	mDNSResponder	[R3296] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'zlPy1f3ZueoTFr97yod54g=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:15.001225-0500	RedLemon	tcp_input [C9.1:3] flags=[F.] seq=2363102227, ack=4031743488, win=16 state=FIN_WAIT_2 rcv_nxt=2363102227, snd_una=4031743488
default	16:46:15.037825-0500	RedLemon	nw_endpoint_resolver_update [C17.1 Hostname#853c3608:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#9d73c199.443
default	16:46:15.038361-0500	RedLemon	nw_endpoint_resolver_update [C17.1 Hostname#853c3608:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#bad43567:443
default	16:46:15.038563-0500	RedLemon	[C17.1 Hostname#853c3608:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.050s
default	16:46:15.038906-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 initial path ((null))] event: path:start @0.050s
default	16:46:15.039581-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.051s, uuid: 86550D1F-50B6-46DC-B56E-5E1185CA0CA1
default	16:46:15.039804-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.051s
default	16:46:15.040797-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.052s
default	16:46:15.041969-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.053s
default	16:46:15.042195-0500	RedLemon	tcp_output [C17.1.1:3] flags=[SEC] seq=2441287848, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2441287848
default	16:46:15.042598-0500	RedLemon	nw_endpoint_resolver_update [C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7a3df01a:443
default	16:46:15.042716-0500	RedLemon	[C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.075s
default	16:46:15.042907-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 initial path ((null))] event: path:start @0.075s
default	16:46:15.043284-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.075s, uuid: F2D7B4CA-6288-420E-9980-3F1520D94534
default	16:46:15.043421-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.075s
default	16:46:15.043929-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.076s
default	16:46:15.044558-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.076s
default	16:46:15.044737-0500	RedLemon	tcp_output [C16.1:3] flags=[S] seq=62894651, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=62894651
default	16:46:15.045905-0500	RedLemon	nw_endpoint_resolver_update [C17.1 Hostname#853c3608:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#bad43567:443
default	16:46:15.046113-0500	RedLemon	[C17.1 Hostname#853c3608:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.057s
default	16:46:15.055805-0500	RedLemon	tcp_input [C17.1.1:3] flags=[S.E] seq=2241137164, ack=2441287849, win=31416 state=SYN_SENT rcv_nxt=0, snd_una=2441287848
default	16:46:15.055988-0500	RedLemon	nw_flow_connected [C17.1.1 IPv6#9d73c199.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:15.056204-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.067s
default	16:46:15.056329-0500	RedLemon	[C17.1 Hostname#853c3608:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.068s
default	16:46:15.056380-0500	RedLemon	[C17 Hostname#853c3608:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.068s
default	16:46:15.057105-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C17.1.1:2][0x7f7b9a39bff0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:15.057357-0500	RedLemon	boringssl_context_info_handler(2028) [C17.1.1:2][0x7f7b9a39bff0] Client handshake started
default	16:46:15.057564-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS client enter_early_data
default	16:46:15.057699-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS client read_server_hello
default	16:46:15.064646-0500	RedLemon	0x7f7b9c8dec28 ID=272 Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> received response, status 201 content U
default	16:46:15.065270-0500	RedLemon	Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> response ended
default	16:46:15.065707-0500	RedLemon	Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> done using Connection 3
default	16:46:15.065835-0500	RedLemon	Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> summary for task success {transaction_duration_ms=99, response_status=201, connection=3, reused=1, request_start_ms=3, request_duration_ms=17, response_start_ms=97, response_duration_ms=1, request_bytes=496, response_bytes=775, cache_hit=false}
default	16:46:15.066365-0500	RedLemon	Task <AE0EBADE-B552-4FB9-82D5-F09CCF2327E7>.<79> finished successfully
default	16:46:15.066699-0500	RedLemon	✅ Guest joined room UFEF in database
default	16:46:15.067944-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:15.070558-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0B82865D-9736-406A-BA94-F5E12A145D54] (reporting strategy default)> on Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> was not selected for reporting
default	16:46:15.072396-0500	RedLemon	Connection 18: enabling TLS
default	16:46:15.072434-0500	RedLemon	Connection 18: starting, TC(0x0)
default	16:46:15.072484-0500	RedLemon	[C18 5DF219FE-1275-47EC-919F-11CCE4C331B3 Hostname#3e78bf88:443 tcp, url hash: fb28feca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{D0824A66-ADA8-4C08-ADC2-1A1A6C56348D}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:15.072575-0500	RedLemon	[C18 Hostname#3e78bf88:443 initial path ((null))] event: path:start @0.000s
default	16:46:15.072989-0500	RedLemon	[C18 Hostname#3e78bf88:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 1CDF78E4-30A2-4E6C-B38E-FA91B15C0972
default	16:46:15.073285-0500	RedLemon	[C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:15.073334-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state preparing
default	16:46:15.073607-0500	mDNSResponder	[R3297] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'UKEj+SxGrd32X1Y1OFZKQw=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:15.073609-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> setting up Connection 18
default	16:46:15.076186-0500	RedLemon	nw_endpoint_resolver_update [C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#90b4c047:443
default	16:46:15.076318-0500	mDNSResponder	[R3297] getaddrinfo stop -- hostname: <mask.hash: 'UKEj+SxGrd32X1Y1OFZKQw=='>, client pid: 10341 (RedLemon)
default	16:46:15.076366-0500	RedLemon	nw_endpoint_resolver_update [C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#b7c47849:443
default	16:46:15.076647-0500	RedLemon	[C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.004s
default	16:46:15.077239-0500	RedLemon	[C18.1 IPv4#90b4c047:443 initial path ((null))] event: path:start @0.004s
default	16:46:15.077721-0500	RedLemon	[C18.1 IPv4#90b4c047:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: 52560BC5-EEA9-4E3E-A60A-D96368319FC0
default	16:46:15.077987-0500	RedLemon	[C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.005s
default	16:46:15.079857-0500	RedLemon	[C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.007s
default	16:46:15.080507-0500	RedLemon	[C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.007s
default	16:46:15.080636-0500	RedLemon	tcp_output [C18.1:3] flags=[S] seq=2721496632, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2721496632
default	16:46:15.088330-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:15.088637-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:15.089063-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:15.091311-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:15.092966-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:15.093030-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:15.095316-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C17.1.1:2][0x7f7b9a39bff0] Performing external trust evaluation
default	16:46:15.095473-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C17.1.1:2][0x7f7b9a39bff0] Asyncing for external verify block
default	16:46:15.095649-0500	RedLemon	Connection 17: asked to evaluate TLS Trust
default	16:46:15.096163-0500	RedLemon	tcp_input [C18.1:3] flags=[S.] seq=3110583643, ack=2721496633, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2721496632
default	16:46:15.096297-0500	RedLemon	nw_flow_connected [C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:15.096719-0500	RedLemon	[C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.024s
default	16:46:15.096781-0500	RedLemon	[C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.024s
default	16:46:15.097147-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C18.1:2][0x7f7b9cb5ef60] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:15.097260-0500	RedLemon	boringssl_context_info_handler(2028) [C18.1:2][0x7f7b9cb5ef60] Client handshake started
default	16:46:15.097419-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS client enter_early_data
default	16:46:15.097543-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS client read_server_hello
default	16:46:15.099091-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> auth completion disp=1 cred=0x0
default	16:46:15.109973-0500	RedLemon	Connection 17: TLS Trust result 0
default	16:46:15.110018-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C17.1.1:2][0x7f7b9a39bff0] Returning from external verify block with result: true
default	16:46:15.110100-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C17.1.1:2][0x7f7b9a39bff0] Certificate verification result: OK
default	16:46:15.110701-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:15.111121-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:15.111156-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:15.111210-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:15.111253-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:15.111422-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS 1.3 client done
default	16:46:15.111711-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS client finish_client_handshake
default	16:46:15.111776-0500	RedLemon	boringssl_context_info_handler(2045) [C17.1.1:2][0x7f7b9a39bff0] Client handshake state: TLS client done
default	16:46:15.111819-0500	RedLemon	boringssl_context_info_handler(2034) [C17.1.1:2][0x7f7b9a39bff0] Client handshake done
default	16:46:15.112611-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C17.1.1:2][0x7f7b9a39bff0] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(55ms) flight_time(34ms) rtt(31ms) write_stalls(0) read_stalls(7)]
default	16:46:15.113075-0500	RedLemon	nw_flow_connected [C17.1.1 IPv6#9d73c199.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:15.114037-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.125s
default	16:46:15.114408-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C17] reporting state ready
default	16:46:15.114851-0500	RedLemon	[C17.1 Hostname#853c3608:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.126s
default	16:46:15.115011-0500	RedLemon	[C17 Hostname#853c3608:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.126s
default	16:46:15.115416-0500	RedLemon	[C17.1.1 IPv6#9d73c199.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.127s
default	16:46:15.115545-0500	RedLemon	[C17.1 Hostname#853c3608:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.127s
default	16:46:15.115662-0500	RedLemon	[C17 Hostname#853c3608:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.127s
default	16:46:15.115818-0500	RedLemon	Connection 17: connected successfully
default	16:46:15.115864-0500	RedLemon	Connection 17: TLS handshake complete
default	16:46:15.116327-0500	RedLemon	Connection 17: ready C(N) E(N)
default	16:46:15.116707-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> now using Connection 17
default	16:46:15.116877-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> now using Connection 17
default	16:46:15.117008-0500	RedLemon	Connection 17: received viability advisory(Y)
default	16:46:15.117136-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> sent request, body N 0
default	16:46:15.117183-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> sent request, body N 0
default	16:46:15.119894-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:15.119941-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:15.120146-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:15.120846-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:15.121015-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:15.121135-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:15.121823-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C18.1:2][0x7f7b9cb5ef60] Performing external trust evaluation
default	16:46:15.122042-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C18.1:2][0x7f7b9cb5ef60] Asyncing for external verify block
default	16:46:15.122235-0500	RedLemon	Connection 18: asked to evaluate TLS Trust
default	16:46:15.122586-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> auth completion disp=1 cred=0x0
default	16:46:15.130511-0500	RedLemon	Connection 18: TLS Trust result 0
default	16:46:15.130634-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C18.1:2][0x7f7b9cb5ef60] Returning from external verify block with result: true
default	16:46:15.130803-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C18.1:2][0x7f7b9cb5ef60] Certificate verification result: OK
default	16:46:15.131282-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:15.131381-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:15.131402-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:15.131418-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:15.131434-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:15.131499-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS 1.3 client done
default	16:46:15.131644-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS client finish_client_handshake
default	16:46:15.131683-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1:2][0x7f7b9cb5ef60] Client handshake state: TLS client done
default	16:46:15.131702-0500	RedLemon	boringssl_context_info_handler(2034) [C18.1:2][0x7f7b9cb5ef60] Client handshake done
default	16:46:15.132217-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C18.1:2][0x7f7b9cb5ef60] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(35ms) flight_time(23ms) rtt(22ms) write_stalls(0) read_stalls(7)]
default	16:46:15.132369-0500	RedLemon	nw_flow_connected [C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:15.132611-0500	RedLemon	[C18.1 IPv4#90b4c047:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.060s
default	16:46:15.132858-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state ready
default	16:46:15.132949-0500	RedLemon	[C18 Hostname#3e78bf88:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.060s
default	16:46:15.133060-0500	RedLemon	[C18.1 IPv4#90b4c047:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.060s
default	16:46:15.133116-0500	RedLemon	[C18 Hostname#3e78bf88:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.060s
default	16:46:15.133239-0500	RedLemon	Connection 18: connected successfully
default	16:46:15.133282-0500	RedLemon	Connection 18: TLS handshake complete
default	16:46:15.133503-0500	RedLemon	Connection 18: ready C(N) E(N)
default	16:46:15.133681-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> now using Connection 18
default	16:46:15.133819-0500	RedLemon	Connection 18: received viability advisory(Y)
default	16:46:15.134061-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> sent request, body N 0
default	16:46:15.144148-0500	mDNSResponder	[R3296] getaddrinfo stop -- hostname: <mask.hash: 'zlPy1f3ZueoTFr97yod54g=='>, client pid: 10341 (RedLemon)
default	16:46:15.159480-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> received response, status 200 content K
default	16:46:15.162126-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> done using Connection 17
default	16:46:15.162318-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> response ended
default	16:46:15.163023-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> summary for task success {transaction_duration_ms=184, response_status=200, connection=17, reused=1, request_start_ms=138, request_duration_ms=0, response_start_ms=181, response_duration_ms=3, request_bytes=36, response_bytes=63356, cache_hit=false}
default	16:46:15.163141-0500	RedLemon	Task <D89FA72E-2016-4EF0-845C-10FB103D00CA>.<81> finished successfully
default	16:46:15.165221-0500	RedLemon	[C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.197s
default	16:46:15.166930-0500	RedLemon	tcp_input [C16.1:3] flags=[S.] seq=2849378408, ack=62894652, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=62894651
default	16:46:15.167356-0500	RedLemon	nw_flow_connected [C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:15.167509-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.199s
default	16:46:15.167566-0500	RedLemon	[C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.199s
default	16:46:15.167907-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C16.1:2][0x7f7b9cb6f570] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:15.168015-0500	RedLemon	boringssl_context_info_handler(2028) [C16.1:2][0x7f7b9cb6f570] Client handshake started
default	16:46:15.168193-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS client enter_early_data
default	16:46:15.168318-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS client read_server_hello
default	16:46:15.171231-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> received response, status 200 content K
default	16:46:15.188919-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> done using Connection 17
default	16:46:15.189126-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> response ended
default	16:46:15.189861-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> summary for task success {transaction_duration_ms=213, response_status=200, connection=17, protocol="h2", domain_lookup_duration_ms=48, connect_duration_ms=72, secure_connection_duration_ms=55, private_relay=false, request_start_ms=140, request_duration_ms=0, response_start_ms=194, response_duration_ms=18, request_bytes=128, response_bytes=118334, cache_hit=false}
default	16:46:15.190124-0500	RedLemon	Task <8DC01C71-FB31-4298-97C4-9AD8AF46D8DB>.<80> finished successfully
default	16:46:15.208986-0500	mDNSResponder	[R3295] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 10341 (RedLemon)
default	16:46:15.252609-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> received response, status 101 content U
default	16:46:15.252933-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> response ended
default	16:46:15.252995-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> done using Connection 18
default	16:46:15.253525-0500	RedLemon	[C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.180s
default	16:46:15.253562-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state preparing
default	16:46:15.253602-0500	RedLemon	[C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.181s
default	16:46:15.253675-0500	RedLemon	[C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.181s
default	16:46:15.253705-0500	RedLemon	[C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.181s
default	16:46:15.253746-0500	RedLemon	nw_flow_connected [C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:15.253860-0500	RedLemon	[C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.181s
default	16:46:15.253918-0500	RedLemon	[C18 Hostname#3e78bf88:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.181s
default	16:46:15.254034-0500	RedLemon	nw_flow_connected [C18.1 IPv4#90b4c047:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:15.254302-0500	RedLemon	[C18.1 IPv4#90b4c047:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.181s
default	16:46:15.254329-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state ready
default	16:46:15.254405-0500	RedLemon	[C18 Hostname#3e78bf88:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.181s
default	16:46:15.255795-0500	RedLemon	📤 Realtime: Sending message type: chat, sender: 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:46:15.256531-0500	RedLemon	   Payload keys: senderId, position, chatText, timestamp, type, chatUsername
default	16:46:15.257102-0500	RedLemon	✅ Realtime: Message broadcast complete
default	16:46:15.268276-0500	RedLemon	Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:15.268784-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CB4543DF-AC92-4337-816C-1A2AA36B0194] (reporting strategy default)> on Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> was not selected for reporting
default	16:46:15.269470-0500	RedLemon	Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:15.269897-0500	RedLemon	Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> now using Connection 3
default	16:46:15.275227-0500	RedLemon	0x7f7b9cb35478 ID=276 Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> sent request, body N 0
default	16:46:15.293637-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:15.293776-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:15.294075-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:15.294707-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:15.295950-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:15.296015-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:15.297204-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C16.1:2][0x7f7b9cb6f570] Performing external trust evaluation
default	16:46:15.297343-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C16.1:2][0x7f7b9cb6f570] Asyncing for external verify block
default	16:46:15.297640-0500	RedLemon	Connection 16: asked to evaluate TLS Trust
default	16:46:15.298027-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> auth completion disp=1 cred=0x0
default	16:46:15.299220-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:46:15.299418-0500	RedLemon	   Payload keys: chatUsername, type, position, timestamp, chatText, senderId
default	16:46:15.300009-0500	RedLemon	✅ Realtime: Decoded message type: chat, sender: 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:46:15.300182-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: chat
default	16:46:15.300308-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:46:15.300440-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from lemontom in room UFEF
default	16:46:15.300615-0500	RedLemon	👋 Received: Guest 'lemontom' joined room UFEF
default	16:46:15.309154-0500	RedLemon	Connection 16: TLS Trust result 0
default	16:46:15.309217-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C16.1:2][0x7f7b9cb6f570] Returning from external verify block with result: true
default	16:46:15.309293-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C16.1:2][0x7f7b9cb6f570] Certificate verification result: OK
default	16:46:15.309847-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:15.310362-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:15.310400-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:15.310434-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:15.310575-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:15.310790-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS 1.3 client done
default	16:46:15.310976-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS client finish_client_handshake
default	16:46:15.311091-0500	RedLemon	boringssl_context_info_handler(2045) [C16.1:2][0x7f7b9cb6f570] Client handshake state: TLS client done
default	16:46:15.311157-0500	RedLemon	boringssl_context_info_handler(2034) [C16.1:2][0x7f7b9cb6f570] Client handshake done
default	16:46:15.311965-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C16.1:2][0x7f7b9cb6f570] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(143ms) flight_time(126ms) rtt(125ms) write_stalls(0) read_stalls(7)]
default	16:46:15.312820-0500	RedLemon	nw_flow_connected [C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:15.313183-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.345s
default	16:46:15.319027-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state ready
default	16:46:15.319116-0500	RedLemon	[C16 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.351s
default	16:46:15.319251-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.351s
default	16:46:15.319312-0500	RedLemon	[C16 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.351s
default	16:46:15.319613-0500	RedLemon	Connection 16: connected successfully
default	16:46:15.319660-0500	RedLemon	Connection 16: TLS handshake complete
default	16:46:15.319899-0500	RedLemon	Connection 16: ready C(N) E(N)
default	16:46:15.320099-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> now using Connection 16
default	16:46:15.320194-0500	RedLemon	Connection 16: received viability advisory(Y)
default	16:46:15.320419-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> sent request, body N 0
default	16:46:15.331552-0500	RedLemon	0x7f7b9cb35478 ID=276 Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> received response, status 200 content U
default	16:46:15.332066-0500	RedLemon	Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> response ended
default	16:46:15.332448-0500	RedLemon	Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> done using Connection 3
default	16:46:15.332611-0500	RedLemon	Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=5, response_start_ms=62, response_duration_ms=1, request_bytes=512, response_bytes=840, cache_hit=false}
default	16:46:15.332797-0500	RedLemon	Task <D0FFB404-01B9-4AFE-823B-4E1B87C9E4FC>.<82> finished successfully
default	16:46:15.334125-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2548 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:15.334376-0500	RedLemon	Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:15.334405-0500	runningboardd	Assertion 166-10341-2548 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:15.334764-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [09E6288F-73FC-4DD0-AEB0-D9D65CE992EF] (reporting strategy default)> on Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> was not selected for reporting
default	16:46:15.335449-0500	RedLemon	Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:15.335711-0500	RedLemon	Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> now using Connection 3
default	16:46:15.336622-0500	RedLemon	0x7f7b9d56c028 ID=280 Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> sent request, body N 0
default	16:46:15.337141-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:15.337177-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:15.337244-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:15.341381-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2549 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:15.341639-0500	runningboardd	Assertion 166-103-2549 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:15.342989-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:15.343031-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:15.343071-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:15.393917-0500	RedLemon	0x7f7b9d56c028 ID=280 Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> received response, status 200 content U
default	16:46:15.394426-0500	RedLemon	Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> response ended
default	16:46:15.394826-0500	RedLemon	Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> done using Connection 3
default	16:46:15.394999-0500	RedLemon	Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> summary for task success {transaction_duration_ms=59, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=58, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:46:15.395191-0500	RedLemon	Task <44195EBF-EEA3-46DC-874A-B4E7AA956417>.<83> finished successfully
default	16:46:15.397269-0500	RedLemon	Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:15.397778-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D99A6B8D-6DB6-4244-A4C6-851AF94091FA] (reporting strategy default)> on Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> was not selected for reporting
default	16:46:15.398626-0500	RedLemon	Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:15.398881-0500	RedLemon	Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> now using Connection 3
default	16:46:15.400029-0500	RedLemon	0x7f7b9ccf5898 ID=284 Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> sent request, body N 0
default	16:46:15.415535-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	16:46:15.442902-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> received response, status 101 content U
default	16:46:15.443136-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> response ended
default	16:46:15.443250-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> done using Connection 16
default	16:46:15.444164-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.476s
default	16:46:15.444236-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state preparing
default	16:46:15.444336-0500	RedLemon	[C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.476s
default	16:46:15.444554-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.476s
default	16:46:15.444643-0500	RedLemon	[C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.476s
default	16:46:15.444757-0500	RedLemon	nw_flow_connected [C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:15.444960-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.477s
default	16:46:15.445050-0500	RedLemon	[C16 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.477s
default	16:46:15.445226-0500	RedLemon	nw_flow_connected [C16.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:15.445734-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.477s
default	16:46:15.445801-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state ready
default	16:46:15.446001-0500	RedLemon	[C16 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.478s
default	16:46:15.458873-0500	RedLemon	0x7f7b9ccf5898 ID=284 Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> received response, status 200 content U
default	16:46:15.459497-0500	RedLemon	Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> response ended
default	16:46:15.459984-0500	RedLemon	Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> done using Connection 3
default	16:46:15.460217-0500	RedLemon	Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> summary for task success {transaction_duration_ms=62, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=60, response_duration_ms=1, request_bytes=524, response_bytes=846, cache_hit=true}
default	16:46:15.460937-0500	RedLemon	Task <553A27DE-16E9-42CA-AE30-08868E46777F>.<84> finished successfully
default	16:46:15.463809-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:46:15.464238-0500	RedLemon	👋 lemontom joined room
default	16:46:15.464616-0500	RedLemon	Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:15.465485-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1E4CF61F-9A11-49E9-AD9C-8A2E5CDBBA09] (reporting strategy default)> on Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> was not selected for reporting
default	16:46:15.466394-0500	RedLemon	Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:15.467427-0500	RedLemon	Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> now using Connection 3
default	16:46:15.468900-0500	RedLemon	0x7f7b9cb68e28 ID=288 Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> sent request, body N 0
default	16:46:15.559453-0500	RedLemon	0x7f7b9cb68e28 ID=288 Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> received response, status 200 content U
default	16:46:15.559875-0500	RedLemon	Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> response ended
default	16:46:15.560311-0500	RedLemon	Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> done using Connection 3
default	16:46:15.560647-0500	RedLemon	Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> summary for task success {transaction_duration_ms=94, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=93, response_duration_ms=1, request_bytes=500, response_bytes=966, cache_hit=false}
default	16:46:15.560904-0500	RedLemon	Task <B45B150A-9304-4D2E-A14B-C5D6EFE73876>.<85> finished successfully
default	16:46:15.568316-0500	RedLemon	nw_flow_disconnected [C16.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	16:46:15.568633-0500	RedLemon	nw_protocol_tcp_log_summary [C16.1:3] 
	[A13A7863-7E8F-4F45-AC9B-5203E3F9DA22 <private>:57951<-><private>:443]
	Init: 1, Conn_Time: 122.611ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 137.343ms, rtt_var: 21.000ms rtt_nc: 123.343ms, rtt_var_nc: 27.500ms base rtt: 122ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:15.568833-0500	RedLemon	Connection 16: read-side closed
default	16:46:15.568882-0500	RedLemon	tcp_input [C16.1:3] flags=[F.] seq=2849381439, ack=62895707, win=249 state=ESTABLISHED rcv_nxt=2849381439, snd_una=62895707
default	16:46:15.569387-0500	RedLemon	[C16.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.601s, error Socket is not connected
default	16:46:15.569415-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state failed error Socket is not connected
default	16:46:15.569447-0500	RedLemon	[C16 Hostname#6d693a93:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.601s
error	16:46:15.569482-0500	RedLemon	nw_read_request_report [C16] Receive failed with error "Socket is not connected"
error	16:46:15.569518-0500	RedLemon	nw_flow_service_reads [C16.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	16:46:15.569577-0500	RedLemon	tcp_output [C16.1:3] flags=[F.] seq=62895838, ack=2849381440, win=2048 state=LAST_ACK rcv_nxt=2849381440, snd_una=62895707
error	16:46:15.569657-0500	RedLemon	Connection 16: received failure notification
default	16:46:15.569825-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> summary for task success {transaction_duration_ms=604, response_status=101, connection=16, protocol="http/1.1", domain_lookup_duration_ms=75, connect_duration_ms=269, secure_connection_duration_ms=143, private_relay=false, request_start_ms=355, request_duration_ms=0, response_start_ms=477, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	16:46:15.569860-0500	RedLemon	nw_flow_add_write_request [C16.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	16:46:15.569905-0500	RedLemon	nw_write_request_report [C16] Send failed with error "Socket is not connected"
default	16:46:15.569951-0500	RedLemon	Connection 16: cleaning up
default	16:46:15.569969-0500	RedLemon	Task <95A545F5-C78F-41EB-A41D-A3B58B7629C7>.<1> finished successfully
default	16:46:15.570000-0500	RedLemon	[C16 FF258A6A-8A19-462C-9A9B-ED763CAFF267 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancel
default	16:46:15.570250-0500	RedLemon	[C16 FF258A6A-8A19-462C-9A9B-ED763CAFF267 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancelled
	[C16.1 F2D7B4CA-6288-420E-9980-3F1520D94534 10.0.0.113:57951<->IPv4#7a3df01a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.602s, DNS @0.000s took 0.075s, TCP @0.476s took 0.123s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:15.570903-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state cancelled error Socket is not connected
default	16:46:15.570986-0500	RedLemon	Connection 16: done
error	16:46:15.694711-0500	RedLemon	tcp_input [C16.1:3] flags=[R] seq=2849381440, ack=0, win=0 state=LAST_ACK rcv_nxt=2849381440, snd_una=62895707
default	16:46:16.435877-0500	runningboardd	Invalidating assertion 166-10341-2548 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:16.484941-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:46:16.485310-0500	RedLemon	   Payload keys: type, chatText, senderId, position, timestamp, chatUsername
default	16:46:16.486017-0500	RedLemon	✅ Realtime: Decoded message type: chat, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	16:46:16.486248-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: chat
default	16:46:16.486707-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room UFEF
default	16:46:16.487015-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	16:46:16.486622-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:46:16.506656-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	16:46:16.507014-0500	RedLemon	Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:16.507481-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [08223F11-7AA9-495A-90AE-B73A68D8F561] (reporting strategy default)> on Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> was not selected for reporting
default	16:46:16.508443-0500	RedLemon	Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:16.508713-0500	RedLemon	Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> now using Connection 3
default	16:46:16.510678-0500	RedLemon	0x7f7b9a3c1c78 ID=292 Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> sent request, body N 0
default	16:46:16.546165-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:16.546268-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:16.546336-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:16.548362-0500	runningboardd	Invalidating assertion 166-103-2549 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:16.578568-0500	RedLemon	0x7f7b9a3c1c78 ID=292 Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> received response, status 200 content U
default	16:46:16.579473-0500	RedLemon	Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> response ended
default	16:46:16.580174-0500	RedLemon	Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> done using Connection 3
default	16:46:16.580481-0500	RedLemon	Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=70, response_duration_ms=2, request_bytes=500, response_bytes=957, cache_hit=true}
default	16:46:16.581075-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:16.582489-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BAEFDC3D-342C-497A-A4B6-B51FF7D2DD69] (reporting strategy default)> on Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> was not selected for reporting
default	16:46:16.582777-0500	RedLemon	Task <CC3B9ADB-E4B6-482A-A314-9C8EFBDBFA23>.<86> finished successfully
default	16:46:16.583250-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:16.584258-0500	RedLemon	Connection 19: enabling TLS
default	16:46:16.584305-0500	RedLemon	Connection 19: starting, TC(0x0)
default	16:46:16.584948-0500	RedLemon	[C19 EF67499D-F126-4963-9154-B508874FB163 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{721F2C58-2E64-45F4-A957-0BF07EC59F6D}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:16.585056-0500	RedLemon	[C19 Hostname#6d693a93:443 initial path ((null))] event: path:start @0.000s
default	16:46:16.585299-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	16:46:16.585393-0500	RedLemon	[C19 Hostname#6d693a93:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 8144BB99-401F-44B8-AC22-8527308FB83B
default	16:46:16.585477-0500	RedLemon	🎬 Guest: Fetch took 0.079s, waiting 3.171s (includes 0.25s sync buffer)
default	16:46:16.586370-0500	mDNSResponder	[R3298] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:16.585874-0500	RedLemon	[C19 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:16.586082-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state preparing
default	16:46:16.586544-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> setting up Connection 19
default	16:46:16.587908-0500	mDNSResponder	[R3298] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 10341 (RedLemon)
default	16:46:16.588171-0500	RedLemon	nw_endpoint_resolver_update [C19 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7a3df01a:443
default	16:46:16.588387-0500	RedLemon	[C19 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.003s
default	16:46:16.588720-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 initial path ((null))] event: path:start @0.003s
default	16:46:16.589581-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.004s, uuid: 838CD76A-5112-4235-9A62-8EF9C76CB01B
default	16:46:16.589708-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.004s
default	16:46:16.598071-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.013s
default	16:46:16.598992-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.013s
default	16:46:16.599114-0500	RedLemon	tcp_output [C19.1:3] flags=[S] seq=250242323, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=250242323
default	16:46:16.599113-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2550 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:16.599428-0500	runningboardd	Assertion 166-10341-2550 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:16.600188-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:16.600264-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:16.600306-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:16.602061-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2551 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:16.602202-0500	runningboardd	Assertion 166-103-2551 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:16.739479-0500	RedLemon	tcp_input [C19.1:3] flags=[S.] seq=2048452703, ack=250242324, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=250242323
default	16:46:16.739662-0500	RedLemon	nw_flow_connected [C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:16.739855-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.154s
default	16:46:16.739945-0500	RedLemon	[C19 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.154s
default	16:46:16.740497-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C19.1:2][0x7f7b9e8914b0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:16.740680-0500	RedLemon	boringssl_context_info_handler(2028) [C19.1:2][0x7f7b9e8914b0] Client handshake started
default	16:46:16.741024-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS client enter_early_data
default	16:46:16.741233-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS client read_server_hello
default	16:46:16.944804-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:16.944938-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:16.945419-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:16.945892-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:16.946331-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:16.946444-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:16.947386-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C19.1:2][0x7f7b9e8914b0] Performing external trust evaluation
default	16:46:16.947638-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C19.1:2][0x7f7b9e8914b0] Asyncing for external verify block
default	16:46:16.948193-0500	RedLemon	Connection 19: asked to evaluate TLS Trust
default	16:46:16.948512-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> auth completion disp=1 cred=0x0
default	16:46:16.953830-0500	RedLemon	Connection 19: TLS Trust result 0
default	16:46:16.953898-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C19.1:2][0x7f7b9e8914b0] Returning from external verify block with result: true
default	16:46:16.953984-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C19.1:2][0x7f7b9e8914b0] Certificate verification result: OK
default	16:46:16.954406-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:16.954699-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:16.954735-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:16.954771-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:16.954818-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:16.954941-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS 1.3 client done
default	16:46:16.955106-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS client finish_client_handshake
default	16:46:16.955149-0500	RedLemon	boringssl_context_info_handler(2045) [C19.1:2][0x7f7b9e8914b0] Client handshake state: TLS client done
default	16:46:16.955183-0500	RedLemon	boringssl_context_info_handler(2034) [C19.1:2][0x7f7b9e8914b0] Client handshake done
default	16:46:16.955723-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C19.1:2][0x7f7b9e8914b0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(215ms) flight_time(205ms) rtt(204ms) write_stalls(0) read_stalls(4)]
default	16:46:16.955936-0500	RedLemon	nw_flow_connected [C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:16.956229-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.371s
default	16:46:16.956451-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state ready
default	16:46:16.956485-0500	RedLemon	[C19 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.371s
default	16:46:16.956629-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.371s
default	16:46:16.956737-0500	RedLemon	[C19 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.371s
default	16:46:16.957226-0500	RedLemon	Connection 19: connected successfully
default	16:46:16.957284-0500	RedLemon	Connection 19: TLS handshake complete
default	16:46:16.957504-0500	RedLemon	Connection 19: ready C(N) E(N)
default	16:46:16.957673-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> now using Connection 19
default	16:46:16.957761-0500	RedLemon	Connection 19: received viability advisory(Y)
default	16:46:16.957925-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> sent request, body N 0
default	16:46:17.149148-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> received response, status 101 content U
default	16:46:17.149429-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> response ended
default	16:46:17.149509-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> done using Connection 19
default	16:46:17.150235-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.565s
default	16:46:17.150305-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state preparing
default	16:46:17.150413-0500	RedLemon	[C19 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.565s
default	16:46:17.150579-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.565s
default	16:46:17.150630-0500	RedLemon	[C19 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.565s
default	16:46:17.150696-0500	RedLemon	nw_flow_connected [C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:17.150810-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.565s
default	16:46:17.150856-0500	RedLemon	[C19 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.565s
default	16:46:17.150995-0500	RedLemon	nw_flow_connected [C19.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:17.151479-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.566s
default	16:46:17.151520-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state ready
default	16:46:17.151581-0500	RedLemon	[C19 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.566s
default	16:46:17.353658-0500	RedLemon	tcp_input [C19.1:3] flags=[F.] seq=2048455734, ack=250243378, win=249 state=ESTABLISHED rcv_nxt=2048455734, snd_una=250243378
default	16:46:17.353770-0500	RedLemon	nw_protocol_tcp_log_summary [C19.1:3] 
	[5131F3AC-8B23-4152-AEBB-678C8CD9A874 <private>:57953<-><private>:443]
	Init: 1, Conn_Time: 140.516ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 161.062ms, rtt_var: 36.437ms rtt_nc: 160.375ms, rtt_var_nc: 58.937ms base rtt: 122ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:17.355597-0500	RedLemon	nw_flow_disconnected [C19.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	16:46:17.356745-0500	RedLemon	Connection 19: read-side closed
default	16:46:17.356791-0500	RedLemon	Connection 19: read-side closed
default	16:46:17.356827-0500	RedLemon	Connection 19: read-side closed
default	16:46:17.357207-0500	RedLemon	[C19.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.772s, error Socket is not connected
default	16:46:17.357250-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state failed error Socket is not connected
default	16:46:17.357312-0500	RedLemon	[C19 Hostname#6d693a93:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.772s
default	16:46:17.357377-0500	RedLemon	tcp_output [C19.1:3] flags=[F.] seq=250243509, ack=2048455735, win=2048 state=LAST_ACK rcv_nxt=2048455735, snd_una=250243378
error	16:46:17.357450-0500	RedLemon	Connection 19: received failure notification
error	16:46:17.357798-0500	RedLemon	nw_read_request_report [C19] Receive failed with error "Socket is not connected"
error	16:46:17.357884-0500	RedLemon	nw_flow_service_reads [C19.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	16:46:17.358314-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> summary for task success {transaction_duration_ms=775, response_status=101, connection=19, protocol="http/1.1", domain_lookup_duration_ms=3, connect_duration_ms=358, secure_connection_duration_ms=215, private_relay=false, request_start_ms=374, request_duration_ms=0, response_start_ms=566, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	16:46:17.358405-0500	RedLemon	nw_flow_add_write_request [C19.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
default	16:46:17.358443-0500	RedLemon	Task <FC339027-FCF3-4CCB-91B5-93448C254115>.<1> finished successfully
error	16:46:17.358493-0500	RedLemon	nw_write_request_report [C19] Send failed with error "Socket is not connected"
default	16:46:17.358606-0500	RedLemon	Connection 19: cleaning up
default	16:46:17.358668-0500	RedLemon	[C19 EF67499D-F126-4963-9154-B508874FB163 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancel
default	16:46:17.358778-0500	RedLemon	[C19 EF67499D-F126-4963-9154-B508874FB163 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancelled
	[C19.1 838CD76A-5112-4235-9A62-8EF9C76CB01B 10.0.0.113:57953<->IPv4#7a3df01a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.773s, DNS @0.000s took 0.003s, TCP @0.565s took 0.141s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:17.358783-0500	RedLemon	Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:17.358783-0500	RedLemon	Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:17.359755-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D6FD60CF-0141-48EA-A51A-F13B92327985] (reporting strategy default)> on Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> was not selected for reporting
default	16:46:17.359812-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8850D4C6-2F45-4EC1-B0D6-0EDA5862C089] (reporting strategy default)> on Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> was not selected for reporting
default	16:46:17.360450-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state cancelled error Socket is not connected
default	16:46:17.360737-0500	RedLemon	Connection 19: done
default	16:46:17.361123-0500	RedLemon	Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:17.361386-0500	RedLemon	Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> now using Connection 3
default	16:46:17.362472-0500	RedLemon	Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:17.362742-0500	RedLemon	Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> now using Connection 3
default	16:46:17.363852-0500	RedLemon	0x7f7b9d5fcb68 ID=296 Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> sent request, body N 0
default	16:46:17.363899-0500	RedLemon	0x7f7b9f926088 ID=300 Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> sent request, body N 0
default	16:46:17.429096-0500	RedLemon	0x7f7b9d5fcb68 ID=296 Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> received response, status 200 content U
default	16:46:17.430497-0500	RedLemon	Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> response ended
default	16:46:17.431046-0500	RedLemon	Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> done using Connection 3
default	16:46:17.431245-0500	RedLemon	Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=68, response_duration_ms=2, request_bytes=500, response_bytes=959, cache_hit=true}
default	16:46:17.431471-0500	RedLemon	Task <D834C827-4BC7-4D32-8207-62159825D3B6>.<87> finished successfully
default	16:46:17.432652-0500	RedLemon	0x7f7b9f926088 ID=300 Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> received response, status 200 content U
default	16:46:17.433296-0500	RedLemon	Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> response ended
default	16:46:17.433579-0500	RedLemon	🎬 Guest: Detected room playback start via database fallback
default	16:46:17.433774-0500	RedLemon	Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> done using Connection 3
default	16:46:17.434040-0500	RedLemon	Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> summary for task success {transaction_duration_ms=73, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=71, response_duration_ms=1, request_bytes=512, response_bytes=839, cache_hit=true}
default	16:46:17.434289-0500	RedLemon	Task <40FACA55-9508-48FB-9EF3-EB4F9725AC8F>.<88> finished successfully
default	16:46:17.444785-0500	RedLemon	Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:17.445398-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D1634BF7-DAF2-462E-B6EA-1AE3FB5F5149] (reporting strategy default)> on Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> was not selected for reporting
default	16:46:17.446523-0500	RedLemon	Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:17.446836-0500	RedLemon	Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> now using Connection 3
default	16:46:17.448695-0500	RedLemon	0x7f7b9e86e398 ID=304 Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> sent request, body N 0
error	16:46:17.478684-0500	RedLemon	tcp_input [C19.1:3] flags=[R] seq=2048455735, ack=0, win=0 state=LAST_ACK rcv_nxt=2048455735, snd_una=250243378
error	16:46:17.478945-0500	RedLemon	tcp_input [C19.1:3] flags=[R] seq=2048455735, ack=0, win=0 state=CLOSED rcv_nxt=2048455735, snd_una=250243378
error	16:46:17.479275-0500	RedLemon	tcp_input [C19.1:3] flags=[R] seq=2048455735, ack=0, win=0 state=CLOSED rcv_nxt=2048455735, snd_una=250243378
error	16:46:17.479574-0500	RedLemon	tcp_input [C19.1:3] flags=[R] seq=2048455735, ack=0, win=0 state=CLOSED rcv_nxt=2048455735, snd_una=250243378
error	16:46:17.480705-0500	RedLemon	tcp_input [C19.1:3] flags=[R] seq=2048455735, ack=0, win=0 state=CLOSED rcv_nxt=2048455735, snd_una=250243378
error	16:46:17.480775-0500	RedLemon	tcp_input [C19.1:3] flags=[R] seq=2048455735, ack=0, win=0 state=CLOSED rcv_nxt=2048455735, snd_una=250243378
default	16:46:17.522221-0500	RedLemon	0x7f7b9e86e398 ID=304 Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> received response, status 200 content U
default	16:46:17.523116-0500	RedLemon	Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> response ended
default	16:46:17.523802-0500	RedLemon	Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> done using Connection 3
default	16:46:17.524277-0500	RedLemon	Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> summary for task success {transaction_duration_ms=78, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=76, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:46:17.524477-0500	RedLemon	Task <0434D50F-7374-4421-927A-F5F639B66C2A>.<89> finished successfully
default	16:46:17.526541-0500	RedLemon	Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:17.526909-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A147F468-53D2-438C-8064-007B2D4F97FB] (reporting strategy default)> on Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> was not selected for reporting
default	16:46:17.527627-0500	RedLemon	Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:17.527828-0500	RedLemon	Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> now using Connection 3
default	16:46:17.528879-0500	RedLemon	0x7f7b9a395048 ID=308 Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> sent request, body N 0
default	16:46:17.601123-0500	RedLemon	0x7f7b9a395048 ID=308 Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> received response, status 200 content U
default	16:46:17.601509-0500	RedLemon	Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> response ended
default	16:46:17.601855-0500	RedLemon	Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> done using Connection 3
default	16:46:17.602152-0500	RedLemon	Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> summary for task success {transaction_duration_ms=74, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=73, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:46:17.602410-0500	RedLemon	Task <BB4F4753-0FE9-4673-A4CA-6A114EB240CE>.<90> finished successfully
default	16:46:17.604602-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:46:17.606133-0500	runningboardd	Invalidating assertion 166-10341-2550 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:17.722148-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:17.722225-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:17.722318-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:17.724261-0500	runningboardd	Invalidating assertion 166-103-2551 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:17.890059-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:17.890456-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:17.890645-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:18.395617-0500	runningboardd	Assertion did invalidate due to timeout: 166-129-2542 (target:[anon<RedLemon>(501):10341])
default	16:46:18.537034-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:18.537426-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:18.537494-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:19.537808-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:19.538511-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7871CB0D-D524-46AA-B2B2-CCCF381BD2A0] (reporting strategy default)> on Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> was not selected for reporting
default	16:46:19.538904-0500	RedLemon	Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:19.540343-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.541093-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D2AA0B8A-AAF5-46F6-8F14-5BF54C389A9C] (reporting strategy default)> on Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> was not selected for reporting
default	16:46:19.542082-0500	RedLemon	Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.542337-0500	RedLemon	Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> now using Connection 3
default	16:46:19.543587-0500	RedLemon	Connection 20: enabling TLS
default	16:46:19.543694-0500	RedLemon	Connection 20: starting, TC(0x0)
default	16:46:19.543766-0500	RedLemon	[C20 BD809DC4-F73F-4129-8D9B-764791B39305 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{7D84B349-9528-4E2F-98A7-B38C01A1637A}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:19.544014-0500	RedLemon	[C20 Hostname#6d693a93:443 initial path ((null))] event: path:start @0.000s
default	16:46:19.544430-0500	RedLemon	[C20 Hostname#6d693a93:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 45401E6F-6D76-4380-AF76-17E86C233793
default	16:46:19.544667-0500	RedLemon	[C20 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:19.544706-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state preparing
default	16:46:19.545424-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> setting up Connection 20
default	16:46:19.545598-0500	mDNSResponder	[R3299] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:19.545588-0500	RedLemon	0x7f7b9e890608 ID=312 Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> sent request, body N 0
default	16:46:19.546977-0500	mDNSResponder	[R3299] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 10341 (RedLemon)
default	16:46:19.547184-0500	RedLemon	nw_endpoint_resolver_update [C20 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7a3df01a:443
default	16:46:19.547303-0500	RedLemon	[C20 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.003s
default	16:46:19.547533-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 initial path ((null))] event: path:start @0.003s
default	16:46:19.547915-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: EB5C1032-4CAA-42AC-AA70-38A70A26590A
default	16:46:19.548041-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.004s
default	16:46:19.549701-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.005s
default	16:46:19.550601-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.006s
default	16:46:19.550721-0500	RedLemon	tcp_output [C20.1:3] flags=[S] seq=609027280, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=609027280
default	16:46:19.607651-0500	RedLemon	0x7f7b9e890608 ID=312 Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> received response, status 200 content U
default	16:46:19.608205-0500	RedLemon	Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> response ended
default	16:46:19.608623-0500	RedLemon	Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> done using Connection 3
default	16:46:19.608989-0500	RedLemon	Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> summary for task success {transaction_duration_ms=67, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=3, response_start_ms=65, response_duration_ms=1, request_bytes=500, response_bytes=956, cache_hit=true}
default	16:46:19.609071-0500	RedLemon	Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:19.609513-0500	RedLemon	Task <3F2F68AA-651C-4EAA-9BBC-5B34A4E6E7C0>.<91> finished successfully
default	16:46:19.612262-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C99C760C-EE18-43FA-8B80-A1074231CD8E] (reporting strategy default)> on Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> was not selected for reporting
default	16:46:19.678987-0500	RedLemon	Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.689086-0500	RedLemon	Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> now using Connection 3
default	16:46:19.733922-0500	RedLemon	0x7f7b9e890608 ID=316 Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> sent request, body N 0
default	16:46:19.735189-0500	RedLemon	tcp_input [C20.1:3] flags=[S.] seq=2258304668, ack=609027281, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=609027280
default	16:46:19.735368-0500	RedLemon	nw_flow_connected [C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:19.735541-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.191s
default	16:46:19.735630-0500	RedLemon	[C20 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.191s
default	16:46:19.736239-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C20.1:2][0x7f7b9d5266b0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:19.736345-0500	RedLemon	boringssl_context_info_handler(2028) [C20.1:2][0x7f7b9d5266b0] Client handshake started
default	16:46:19.736507-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS client enter_early_data
default	16:46:19.736629-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS client read_server_hello
default	16:46:19.767236-0500	RedLemon	0x7f7b9e890608 ID=316 Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> received response, status 200 content U
default	16:46:19.770637-0500	RedLemon	Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> response ended
default	16:46:19.771073-0500	RedLemon	Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> done using Connection 3
default	16:46:19.771246-0500	RedLemon	Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> summary for task success {transaction_duration_ms=107, response_status=200, connection=3, reused=1, request_start_ms=25, request_duration_ms=44, response_start_ms=103, response_duration_ms=4, request_bytes=512, response_bytes=839, cache_hit=true}
default	16:46:19.771430-0500	RedLemon	Task <598C5C0B-ADFF-45F6-9464-F6AAA5B3DF60>.<92> finished successfully
default	16:46:19.771455-0500	RedLemon	🎬 Guest: Starting playback after countdown
default	16:46:19.771563-0500	RedLemon	🎬 Guest: Launching player for Frankenstein
default	16:46:19.771828-0500	RedLemon	   Quality: 1080p
default	16:46:19.772255-0500	RedLemon	   Mode: watchParty
default	16:46:19.772381-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	16:46:19.830631-0500	RedLemon	Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:19.831211-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6E71D12A-F366-40C7-ACCA-765FA00B1E4E] (reporting strategy default)> on Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> was not selected for reporting
default	16:46:19.832231-0500	RedLemon	Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.832496-0500	RedLemon	Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> now using Connection 3
default	16:46:19.834819-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt1312221/img
default	16:46:19.835047-0500	RedLemon	0x7f7b9e871128 ID=320 Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> sent request, body N 0
default	16:46:19.836596-0500	RedLemon	⏳ Background art loading...
default	16:46:19.837225-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt1312221/img
default	16:46:19.838495-0500	RedLemon	⏳ Logo loading...
default	16:46:19.861166-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:19.861309-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:19.861691-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:19.862396-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:19.863481-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:19.863578-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:19.864286-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C20.1:2][0x7f7b9d5266b0] Performing external trust evaluation
default	16:46:19.864558-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C20.1:2][0x7f7b9d5266b0] Asyncing for external verify block
default	16:46:19.864880-0500	RedLemon	Connection 20: asked to evaluate TLS Trust
default	16:46:19.865354-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> auth completion disp=1 cred=0x0
default	16:46:19.874336-0500	RedLemon	Connection 20: TLS Trust result 0
default	16:46:19.874391-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C20.1:2][0x7f7b9d5266b0] Returning from external verify block with result: true
default	16:46:19.874465-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C20.1:2][0x7f7b9d5266b0] Certificate verification result: OK
default	16:46:19.874990-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:19.875247-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:19.875281-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:19.875309-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:19.875341-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:19.875531-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS 1.3 client done
default	16:46:19.875946-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS client finish_client_handshake
default	16:46:19.876039-0500	RedLemon	boringssl_context_info_handler(2045) [C20.1:2][0x7f7b9d5266b0] Client handshake state: TLS client done
default	16:46:19.876148-0500	RedLemon	boringssl_context_info_handler(2034) [C20.1:2][0x7f7b9d5266b0] Client handshake done
default	16:46:19.876905-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C20.1:2][0x7f7b9d5266b0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(140ms) flight_time(126ms) rtt(125ms) write_stalls(0) read_stalls(7)]
default	16:46:19.877080-0500	RedLemon	nw_flow_connected [C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:19.877314-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.333s
default	16:46:19.878196-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state ready
default	16:46:19.878339-0500	RedLemon	[C20 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.334s
default	16:46:19.878637-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.334s
default	16:46:19.878779-0500	RedLemon	[C20 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.334s
default	16:46:19.879240-0500	RedLemon	Connection 20: connected successfully
default	16:46:19.879287-0500	RedLemon	Connection 20: TLS handshake complete
default	16:46:19.879523-0500	RedLemon	Connection 20: ready C(N) E(N)
default	16:46:19.879722-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> now using Connection 20
default	16:46:19.879816-0500	RedLemon	Connection 20: received viability advisory(Y)
default	16:46:19.880064-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> sent request, body N 0
default	16:46:19.883697-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:19.884004-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B5B1EC6C-001A-40C4-9D60-24F6860C0510] (reporting strategy default)> on Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> was not selected for reporting
default	16:46:19.884591-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.884639-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:19.884753-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> now using Connection 17
default	16:46:19.884969-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [876011D3-BE14-4DBF-907C-A93FC40EBCB1] (reporting strategy default)> on Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> was not selected for reporting
default	16:46:19.885035-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> sent request, body N 0
default	16:46:19.885487-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.885695-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> now using Connection 17
default	16:46:19.885894-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> sent request, body N 0
default	16:46:19.896244-0500	RedLemon	Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> summary for task failure {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=0, response_duration_ms=0, request_bytes=524, response_bytes=0, cache_hit=true}
default	16:46:19.896718-0500	RedLemon	Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	16:46:19.898266-0500	RedLemon	Task <4424B561-1ADA-4FDE-8A07-0389AE672094>.<93> done using Connection 3
default	16:46:19.912096-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2552 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:19.918411-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> received response, status 200 content K
default	16:46:19.924016-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> done using Connection 17
default	16:46:19.924144-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> response ended
default	16:46:19.924633-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> summary for task success {transaction_duration_ms=40, response_status=200, connection=17, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=34, response_duration_ms=5, request_bytes=36, response_bytes=63075, cache_hit=false}
default	16:46:19.924717-0500	RedLemon	Task <7678E289-4551-480B-8E3D-D84677E07177>.<94> finished successfully
default	16:46:19.935669-0500	runningboardd	Assertion 166-10341-2552 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:19.941898-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:19.941946-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:19.941991-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:19.943171-0500	RedLemon	✅ Logo loaded successfully
default	16:46:19.945053-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2553 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:19.945215-0500	runningboardd	Assertion 166-103-2553 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:19.946630-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	16:46:19.946774-0500	RedLemon	Task <A381878B-9BB1-4DFD-83A6-0FE973DC753F>.<96> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:19.946810-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	16:46:19.946819-0500	RedLemon	Task <B65D88E5-BBA4-4927-889C-3EF52399207C>.<97> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:19.946979-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	16:46:19.947628-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	16:46:19.947618-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> received response, status 200 content K
default	16:46:19.949179-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B284FAF7-8286-440E-AC2E-5A2901F66C51] (reporting strategy default)> on Task <B65D88E5-BBA4-4927-889C-3EF52399207C>.<97> was not selected for reporting
default	16:46:19.950190-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3122DF1E-F7FF-4C93-8742-08F3201ABFF8] (reporting strategy default)> on Task <A381878B-9BB1-4DFD-83A6-0FE973DC753F>.<96> was not selected for reporting
default	16:46:19.950238-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7FF167CB-E80B-48EC-BE74-35FB5946906F] (reporting strategy default)> on Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> was not selected for reporting
default	16:46:19.950515-0500	RedLemon	Task <B65D88E5-BBA4-4927-889C-3EF52399207C>.<97> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	16:46:19.952636-0500	RedLemon	Task <A381878B-9BB1-4DFD-83A6-0FE973DC753F>.<96> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	16:46:19.955900-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> now using Connection 10
default	16:46:19.957693-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> sent request, body N 0
default	16:46:19.958229-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> done using Connection 17
default	16:46:19.958352-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> response ended
default	16:46:19.958760-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> summary for task success {transaction_duration_ms=73, response_status=200, connection=17, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=11, request_bytes=41, response_bytes=117950, cache_hit=false}
default	16:46:19.958865-0500	RedLemon	Task <AA434F68-721E-46E7-AC87-654CCC2F3C70>.<95> finished successfully
default	16:46:19.946475-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:19.959893-0500	RedLemon	✅ Background art loaded successfully
default	16:46:19.959834-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:19.959883-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:19.963690-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:19.963690-0500	RedLemon	Task <74814478-E371-4DD4-9953-D937BB9B391C>.<98> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:19.964059-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:19.963953-0500	RedLemon	Task <0548D727-BEA4-4950-857C-A65E22DCDE09>.<100> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:19.967307-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [41BD4A3B-CAF8-410C-B1C8-E7A4DC923DCE] (reporting strategy default)> on Task <74814478-E371-4DD4-9953-D937BB9B391C>.<98> was not selected for reporting
default	16:46:19.967477-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0E72745B-0763-4B5C-A55A-9C8F2AED8A63] (reporting strategy default)> on Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> was not selected for reporting
default	16:46:19.967925-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [03632A61-6ED8-4362-9E8A-EDAB7E2BF625] (reporting strategy default)> on Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> was not selected for reporting
default	16:46:19.968164-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [80DB93BF-0B26-4288-A4B8-6B262C3D82A7] (reporting strategy default)> on Task <0548D727-BEA4-4950-857C-A65E22DCDE09>.<100> was not selected for reporting
default	16:46:19.973861-0500	RedLemon	Task <74814478-E371-4DD4-9953-D937BB9B391C>.<98> summary for task success {transaction_duration_ms=6, response_status=200, cache_hit=true}
default	16:46:19.973973-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.974145-0500	RedLemon	Task <74814478-E371-4DD4-9953-D937BB9B391C>.<98> finished successfully
default	16:46:19.974236-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:19.974345-0500	RedLemon	Task <0548D727-BEA4-4950-857C-A65E22DCDE09>.<100> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	16:46:19.974464-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:46:19.974514-0500	RedLemon	Task <0548D727-BEA4-4950-857C-A65E22DCDE09>.<100> finished successfully
default	16:46:19.975227-0500	RedLemon	Connection 21: enabling TLS
default	16:46:19.975264-0500	RedLemon	Connection 21: starting, TC(0x0)
default	16:46:19.975320-0500	RedLemon	[C21 C347B4DE-B31E-4C8B-B69E-2AA5AE777D0A Hostname#1fe58fc9:443 quic-connection, url hash: 2b4c9a84, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:19.975400-0500	RedLemon	[C21 Hostname#1fe58fc9:443 initial path ((null))] event: path:start @0.000s
default	16:46:19.975454-0500	RedLemon	Task <40112379-5D7E-4EB0-A6F1-A3483E4F2CE9>.<102> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:19.975724-0500	RedLemon	[C21 Hostname#1fe58fc9:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: D69D9014-DC3D-4E9E-8D12-0FA780C9760C
default	16:46:19.975764-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E4EAA760-0C8C-482E-8320-8D03412FE9FC] (reporting strategy default)> on Task <40112379-5D7E-4EB0-A6F1-A3483E4F2CE9>.<102> was not selected for reporting
default	16:46:19.976033-0500	RedLemon	[C21 Hostname#1fe58fc9:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	16:46:19.976085-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C21] reporting state preparing
default	16:46:19.976351-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 initial path ((null))] event: path:start @0.000s
default	16:46:19.976696-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 276A42B5-AA78-434F-8D30-9F239870FD53
default	16:46:19.976948-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	16:46:19.977133-0500	mDNSResponder	[R3300] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: '/Gj2O1c4j3rSeiTR0ijpMg=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:19.977272-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> setting up Connection 21
default	16:46:19.977382-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:46:19.977791-0500	RedLemon	Connection 22: enabling TLS
default	16:46:19.977822-0500	RedLemon	Connection 22: starting, TC(0x0)
default	16:46:19.977864-0500	RedLemon	[C22 66FE8865-B20F-48AB-BAAE-28EA128E037A Hostname#6f2ee696:443 quic-connection, url hash: 456e44ac, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:19.977932-0500	RedLemon	[C22 Hostname#6f2ee696:443 initial path ((null))] event: path:start @0.000s
default	16:46:19.978338-0500	RedLemon	[C22 Hostname#6f2ee696:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 95AEDEAF-2FDE-4D46-9110-847A0F82DF73
default	16:46:19.978775-0500	RedLemon	[C22 Hostname#6f2ee696:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	16:46:19.978863-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C22] reporting state preparing
default	16:46:19.979387-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 initial path ((null))] event: path:start @0.001s
default	16:46:19.980326-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: 716F8CAE-6031-4424-871C-AE9C30B0AC38
default	16:46:19.980499-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.002s
default	16:46:19.980704-0500	mDNSResponder	[R3301] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'd17ImWLdTvFdEb9kzi5JhA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:19.980658-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> setting up Connection 22
default	16:46:19.981825-0500	RedLemon	Task <40112379-5D7E-4EB0-A6F1-A3483E4F2CE9>.<102> summary for task success {transaction_duration_ms=5, response_status=200, cache_hit=true}
default	16:46:19.982964-0500	RedLemon	Task <40112379-5D7E-4EB0-A6F1-A3483E4F2CE9>.<102> finished successfully
default	16:46:19.987873-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_alternative @0.012s
default	16:46:19.991825-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#16ca0d91.443
default	16:46:19.991921-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#c6d550e4.443
default	16:46:19.992014-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#4827e855:443
default	16:46:19.992110-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#79ced2de.443
default	16:46:19.992213-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e078b176:443
default	16:46:19.992316-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#5b95baac:443
default	16:46:19.992492-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.017s
default	16:46:19.992665-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_alternative @0.014s
default	16:46:19.992852-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#16ca0d91.443
default	16:46:19.992980-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#c6d550e4.443
default	16:46:19.993109-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#4827e855:443
default	16:46:19.993235-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#79ced2de.443
default	16:46:19.993366-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e078b176:443
default	16:46:19.993705-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#5b95baac:443
default	16:46:19.993891-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.015s
default	16:46:19.994117-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 initial path ((null))] event: path:start @0.018s
default	16:46:19.994594-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.019s, uuid: 0A213595-F72F-417C-868C-0E6A4B0D7AD5
default	16:46:19.994831-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.019s
default	16:46:19.995440-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.020s
default	16:46:19.996223-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.020s
default	16:46:19.996457-0500	RedLemon	tcp_output [C21.1.1:3] flags=[SEC] seq=1076135341, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1076135341
default	16:46:19.996855-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 initial path ((null))] event: path:start @0.018s
default	16:46:19.997647-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.019s, uuid: FCC27FCA-1EE4-46C1-B6C4-132A76DA257F
default	16:46:19.997838-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.019s
default	16:46:19.998661-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.020s
default	16:46:20.000179-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.022s
default	16:46:20.000494-0500	RedLemon	tcp_output [C22.1.1:3] flags=[SEC] seq=2505544466, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2505544466
default	16:46:20.003334-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#c6d550e4.443
default	16:46:20.003427-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#4827e855:443
default	16:46:20.003503-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#79ced2de.443
default	16:46:20.003571-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e078b176:443
default	16:46:20.003650-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#5b95baac:443
default	16:46:20.003746-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.025s
default	16:46:20.003978-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> received response, status 101 content U
default	16:46:20.004174-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> response ended
default	16:46:20.004229-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> done using Connection 20
default	16:46:20.005173-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.461s
default	16:46:20.005217-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state preparing
default	16:46:20.005273-0500	RedLemon	[C20 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.461s
default	16:46:20.005453-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.461s
default	16:46:20.005501-0500	RedLemon	[C20 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.461s
default	16:46:20.005564-0500	RedLemon	nw_flow_connected [C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:20.005943-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.461s
default	16:46:20.006079-0500	RedLemon	[C20 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.462s
default	16:46:20.006755-0500	RedLemon	nw_flow_connected [C20.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:20.006994-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.463s
default	16:46:20.007028-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state ready
default	16:46:20.007078-0500	RedLemon	[C20 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.463s
default	16:46:20.013684-0500	mDNSResponder	[R3300] getaddrinfo stop -- hostname: <mask.hash: '/Gj2O1c4j3rSeiTR0ijpMg=='>, client pid: 10341 (RedLemon)
default	16:46:20.013999-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_alternative @0.036s
default	16:46:20.014712-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#c6d550e4.443
default	16:46:20.014895-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#4827e855:443
default	16:46:20.015048-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#79ced2de.443
default	16:46:20.015188-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e078b176:443
default	16:46:20.015316-0500	RedLemon	nw_endpoint_resolver_update [C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#5b95baac:443
default	16:46:20.015499-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.037s
default	16:46:20.017704-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#c6d550e4.443
default	16:46:20.017851-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#79ced2de.443
default	16:46:20.017946-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#5b95baac:443
default	16:46:20.018038-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#4827e855:443
default	16:46:20.018131-0500	RedLemon	nw_endpoint_resolver_update [C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e078b176:443
default	16:46:20.018316-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.042s
default	16:46:20.018382-0500	RedLemon	tcp_input [C21.1.1:3] flags=[S.E] seq=467887368, ack=1076135342, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1076135341
default	16:46:20.018536-0500	RedLemon	nw_flow_connected [C21.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:20.018999-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.043s
default	16:46:20.019129-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.043s
default	16:46:20.019177-0500	RedLemon	[C21 Hostname#1fe58fc9:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.043s
default	16:46:20.019877-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C21.1.1:2][0x7f7b9c8aa810] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:20.019983-0500	RedLemon	boringssl_context_info_handler(2028) [C21.1.1:2][0x7f7b9c8aa810] Client handshake started
default	16:46:20.020148-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS client enter_early_data
default	16:46:20.020266-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS client read_server_hello
default	16:46:20.020629-0500	RedLemon	tcp_input [C22.1.1:3] flags=[S.E] seq=436878025, ack=2505544467, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2505544466
default	16:46:20.020730-0500	RedLemon	nw_flow_connected [C22.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:20.020843-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.042s
default	16:46:20.020901-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.042s
default	16:46:20.020926-0500	RedLemon	[C22 Hostname#6f2ee696:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.043s
default	16:46:20.023322-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C22.1.1:2][0x7f7b9cc780d0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:20.023382-0500	RedLemon	boringssl_context_info_handler(2028) [C22.1.1:2][0x7f7b9cc780d0] Client handshake started
default	16:46:20.023693-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS client enter_early_data
default	16:46:20.023772-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS client read_server_hello
default	16:46:20.045809-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:20.045888-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:20.046895-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:20.047583-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:20.047645-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:20.047708-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:20.048116-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C21.1.1:2][0x7f7b9c8aa810] Performing external trust evaluation
default	16:46:20.048280-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C21.1.1:2][0x7f7b9c8aa810] Asyncing for external verify block
default	16:46:20.049294-0500	RedLemon	Connection 21: asked to evaluate TLS Trust
default	16:46:20.049585-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> auth completion disp=1 cred=0x0
default	16:46:20.050785-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:20.050858-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:20.051839-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:20.053158-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:20.053289-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:20.055565-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:20.056837-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C22.1.1:2][0x7f7b9cc780d0] Performing external trust evaluation
default	16:46:20.057281-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C22.1.1:2][0x7f7b9cc780d0] Asyncing for external verify block
default	16:46:20.057776-0500	RedLemon	Connection 22: asked to evaluate TLS Trust
default	16:46:20.059309-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> auth completion disp=1 cred=0x0
default	16:46:20.059899-0500	RedLemon	Connection 21: TLS Trust result 0
default	16:46:20.059952-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C21.1.1:2][0x7f7b9c8aa810] Returning from external verify block with result: true
default	16:46:20.060015-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C21.1.1:2][0x7f7b9c8aa810] Certificate verification result: OK
default	16:46:20.060514-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:20.060641-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:20.060725-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:20.060808-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:20.060893-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:20.061124-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS 1.3 client done
default	16:46:20.061758-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS client finish_client_handshake
default	16:46:20.061784-0500	RedLemon	boringssl_context_info_handler(2045) [C21.1.1:2][0x7f7b9c8aa810] Client handshake state: TLS client done
default	16:46:20.061800-0500	RedLemon	boringssl_context_info_handler(2034) [C21.1.1:2][0x7f7b9c8aa810] Client handshake done
default	16:46:20.062633-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C21.1.1:2][0x7f7b9c8aa810] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(43ms) flight_time(27ms) rtt(25ms) write_stalls(0) read_stalls(7)]
default	16:46:20.062798-0500	RedLemon	nw_flow_connected [C21.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:20.063113-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.087s
default	16:46:20.063230-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C21] reporting state ready
default	16:46:20.063344-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.087s
default	16:46:20.063390-0500	RedLemon	[C21 Hostname#1fe58fc9:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.088s
default	16:46:20.063554-0500	RedLemon	[C21.1.1 IPv6#16ca0d91.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.088s
default	16:46:20.063667-0500	RedLemon	[C21.1 Hostname#1fe58fc9:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.088s
default	16:46:20.063724-0500	RedLemon	[C21 Hostname#1fe58fc9:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.088s
default	16:46:20.063855-0500	RedLemon	Connection 21: connected successfully
default	16:46:20.063904-0500	RedLemon	Connection 21: TLS handshake complete
default	16:46:20.064177-0500	RedLemon	Connection 21: ready C(N) E(N)
default	16:46:20.064562-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> now using Connection 21
default	16:46:20.064660-0500	RedLemon	Connection 21: received viability advisory(Y)
default	16:46:20.065676-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> sent request, body N 0
default	16:46:20.069528-0500	RedLemon	Connection 22: TLS Trust result 0
default	16:46:20.069585-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C22.1.1:2][0x7f7b9cc780d0] Returning from external verify block with result: true
default	16:46:20.069664-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C22.1.1:2][0x7f7b9cc780d0] Certificate verification result: OK
default	16:46:20.070221-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:20.070353-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:20.070389-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:20.070421-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:20.070453-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:20.070569-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS 1.3 client done
default	16:46:20.071012-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS client finish_client_handshake
default	16:46:20.071098-0500	RedLemon	boringssl_context_info_handler(2045) [C22.1.1:2][0x7f7b9cc780d0] Client handshake state: TLS client done
default	16:46:20.071131-0500	RedLemon	boringssl_context_info_handler(2034) [C22.1.1:2][0x7f7b9cc780d0] Client handshake done
default	16:46:20.071693-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C22.1.1:2][0x7f7b9cc780d0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(48ms) flight_time(30ms) rtt(27ms) write_stalls(0) read_stalls(7)]
default	16:46:20.071918-0500	RedLemon	nw_flow_connected [C22.1.1 IPv6#16ca0d91.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:20.072248-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.094s
default	16:46:20.072364-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C22] reporting state ready
default	16:46:20.072478-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.094s
default	16:46:20.072676-0500	RedLemon	[C22 Hostname#6f2ee696:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.094s
default	16:46:20.072856-0500	RedLemon	[C22.1.1 IPv6#16ca0d91.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.094s
default	16:46:20.072988-0500	RedLemon	[C22.1 Hostname#6f2ee696:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.095s
default	16:46:20.073134-0500	RedLemon	[C22 Hostname#6f2ee696:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.095s
default	16:46:20.073270-0500	RedLemon	Connection 22: connected successfully
default	16:46:20.073317-0500	RedLemon	Connection 22: TLS handshake complete
default	16:46:20.073558-0500	RedLemon	Connection 22: ready C(N) E(N)
default	16:46:20.074055-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> now using Connection 22
default	16:46:20.074165-0500	RedLemon	Connection 22: received viability advisory(Y)
default	16:46:20.074311-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> sent request, body N 0
default	16:46:20.122792-0500	RedLemon	👋 lemontom left room
default	16:46:20.122986-0500	RedLemon	👋 ursinho left room
default	16:46:20.123472-0500	RedLemon	⚠️ Lobby: Failed to poll room state: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?select=*&id=eq.UFEF, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?select=*&id=eq.UFEF, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <A381878B-9BB1-4DFD-83A6-0FE973DC753F>.<96>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <A381878B-9BB1-4DFD-83A6-0FE973DC753F>.<96>, NSLocalizedDescription=cancelled}
default	16:46:20.123773-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	16:46:20.128015-0500	RedLemon	nw_flow_disconnected [C20.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	16:46:20.128319-0500	RedLemon	nw_protocol_tcp_log_summary [C20.1:3] 
	[8B0BC701-A80C-4AF0-9E2B-1FB62EC58DF9 <private>:57954<-><private>:443]
	Init: 1, Conn_Time: 184.599ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 145.031ms, rtt_var: 29.437ms rtt_nc: 164.625ms, rtt_var_nc: 69.875ms base rtt: 120ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:20.129029-0500	RedLemon	tcp_input [C20.1:3] flags=[F.] seq=2258307700, ack=609028335, win=249 state=ESTABLISHED rcv_nxt=2258307700, snd_una=609028335
default	16:46:20.140199-0500	RedLemon	[C20.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.596s, error Socket is not connected
default	16:46:20.140413-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state failed error Socket is not connected
default	16:46:20.140513-0500	RedLemon	[C20 Hostname#6d693a93:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.596s
error	16:46:20.140583-0500	RedLemon	tcp_output [C20.1:3] flags=[R.] seq=609028466, ack=2258307701, win=2047 state=CLOSED rcv_nxt=2258307701, snd_una=609028335
error	16:46:20.140723-0500	RedLemon	Connection 20: received failure notification
error	16:46:20.141659-0500	RedLemon	nw_read_request_report [C20] Receive failed with error "Socket is not connected"
error	16:46:20.141768-0500	RedLemon	nw_flow_service_reads [C20.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	16:46:20.142009-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> summary for task success {transaction_duration_ms=601, response_status=101, connection=20, protocol="http/1.1", domain_lookup_duration_ms=3, connect_duration_ms=327, secure_connection_duration_ms=140, private_relay=false, request_start_ms=339, request_duration_ms=0, response_start_ms=463, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	16:46:20.142198-0500	RedLemon	Task <0EF68FCD-6B73-423A-A264-D96575A9BC9F>.<1> finished successfully
error	16:46:20.142334-0500	RedLemon	nw_flow_add_write_request [C20.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	16:46:20.142401-0500	RedLemon	nw_write_request_report [C20] Send failed with error "Socket is not connected"
default	16:46:20.142457-0500	RedLemon	Connection 20: cleaning up
default	16:46:20.142532-0500	RedLemon	[C20 BD809DC4-F73F-4129-8D9B-764791B39305 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancel
default	16:46:20.142654-0500	RedLemon	[C20 BD809DC4-F73F-4129-8D9B-764791B39305 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancelled
	[C20.1 EB5C1032-4CAA-42AC-AA70-38A70A26590A 10.0.0.113:57954<->IPv4#7a3df01a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.598s, DNS @0.000s took 0.003s, TCP @0.461s took 0.185s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:20.143066-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state cancelled error Socket is not connected
default	16:46:20.143171-0500	RedLemon	Connection 20: done
default	16:46:20.241518-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> received response, status 200 content U
default	16:46:20.392895-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> received response, status 200 content U
default	16:46:20.495260-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> done using Connection 21
default	16:46:20.495645-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> response ended
default	16:46:20.495886-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> summary for task success {transaction_duration_ms=526, response_status=200, connection=21, protocol="h2", domain_lookup_duration_ms=16, connect_duration_ms=67, secure_connection_duration_ms=43, private_relay=false, request_start_ms=95, request_duration_ms=0, response_start_ms=272, response_duration_ms=254, request_bytes=137, response_bytes=6439, cache_hit=true}
default	16:46:20.496248-0500	RedLemon	Task <1CA5B904-D556-49F2-B58C-3EC566ECA28B>.<99> finished successfully
default	16:46:20.554559-0500	RedLemon	🎬 Guest: Starting playback after database fallback detection
default	16:46:20.554891-0500	RedLemon	🎬 Guest: Launching player via database fallback
default	16:46:20.555126-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	16:46:20.555502-0500	RedLemon	   Quality: 1080p
default	16:46:20.555794-0500	RedLemon	   Mode: watchParty
default	16:46:20.555912-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	16:46:20.612343-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> done using Connection 22
default	16:46:20.612634-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> response ended
default	16:46:20.612835-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> summary for task success {transaction_duration_ms=641, response_status=200, connection=22, protocol="h2", domain_lookup_duration_ms=13, connect_duration_ms=72, secure_connection_duration_ms=48, private_relay=false, request_start_ms=103, request_duration_ms=0, response_start_ms=421, response_duration_ms=219, request_bytes=569, response_bytes=6886, cache_hit=true}
default	16:46:20.613111-0500	RedLemon	Task <D7A63C00-F420-432C-A3CB-EF8822772326>.<101> finished successfully
default	16:46:20.635699-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 206
default	16:46:20.636229-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	16:46:20.636748-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	16:46:20.637753-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	16:46:20.638942-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	16:46:20.640400-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	16:46:20.644604-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	16:46:20.645070-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	16:46:20.645251-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	16:46:20.645399-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	16:46:20.645555-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	16:46:20.645694-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	16:46:20.645838-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	16:46:20.646020-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	16:46:20.646234-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	16:46:20.646528-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	16:46:20.646959-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	16:46:20.647347-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	16:46:20.647592-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	16:46:20.647867-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	16:46:20.648181-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	16:46:20.648709-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	16:46:20.648976-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	16:46:20.649301-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	16:46:20.650800-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	16:46:20.651360-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	16:46:20.651704-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	16:46:20.652198-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	16:46:20.652533-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	16:46:20.652822-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	16:46:20.653054-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	16:46:20.653386-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	16:46:20.653707-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	16:46:20.653989-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	16:46:20.654263-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	16:46:20.654612-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	16:46:20.654866-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	16:46:20.655066-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	16:46:20.655405-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	16:46:20.655673-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	16:46:20.656392-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	16:46:20.659054-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	16:46:20.668322-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	16:46:20.668837-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	16:46:20.669003-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	16:46:20.669153-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	16:46:20.669297-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	16:46:20.669617-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	16:46:20.670137-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	16:46:20.670353-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	16:46:20.670651-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	16:46:20.670871-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	16:46:20.675303-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	16:46:20.675499-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	16:46:20.675508-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	16:46:20.675610-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	16:46:20.676583-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	16:46:20.677155-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [08ACAA58-0B05-491F-A452-01DFABE31A36] (reporting strategy default)> on Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> was not selected for reporting
default	16:46:20.680341-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> now using Connection 12
default	16:46:20.680083-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	16:46:20.681715-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	16:46:20.681898-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	16:46:20.682060-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	16:46:20.682224-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	16:46:20.682482-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	16:46:20.682744-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	16:46:20.682848-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> sent request, body N 0
default	16:46:20.683173-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	16:46:20.683476-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	16:46:20.684520-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	16:46:20.684984-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	16:46:20.685444-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	16:46:20.685765-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	16:46:20.686506-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	16:46:20.688199-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	16:46:20.689296-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	16:46:20.689713-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	16:46:20.690469-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	16:46:20.690695-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	16:46:20.690865-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	16:46:20.691111-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	16:46:20.691482-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	16:46:20.691659-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	16:46:20.691960-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	16:46:20.692274-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	16:46:20.692472-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	16:46:20.692723-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	16:46:20.692960-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	16:46:20.693690-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	16:46:20.693861-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:46:20.693998-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	16:46:20.694116-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:46:20.694226-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	16:46:20.694329-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	16:46:20.694758-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	16:46:20.694880-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	16:46:20.695003-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	16:46:20.695112-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:46:20.695224-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	16:46:20.695323-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.695525-0500	RedLemon	Task <3F5FD2D9-2E70-4B62-9E17-BF03D7D8C16E>.<103> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:20.695761-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	16:46:20.695869-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.696414-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	16:46:20.696566-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	16:46:20.702471-0500	RedLemon	Task <7E8CD93C-FA67-4BD0-87BC-2D4670638102>.<104> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:20.702842-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.702929-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:20.703350-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.703628-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B75B738C-7EFC-49A8-AEB8-51816AC6EF79] (reporting strategy default)> on Task <3F5FD2D9-2E70-4B62-9E17-BF03D7D8C16E>.<103> was not selected for reporting
default	16:46:20.703754-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.703957-0500	RedLemon	Task <BECF56E6-113D-4680-97FE-20E104700E86>.<106> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:20.704281-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:20.706041-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	16:46:20.706268-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	16:46:20.706387-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.706491-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:20.709222-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.709331-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.709872-0500	RedLemon	Task <3F5FD2D9-2E70-4B62-9E17-BF03D7D8C16E>.<103> summary for task success {transaction_duration_ms=5, response_status=200, cache_hit=true}
default	16:46:20.709389-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [75F85D48-13A7-4B7E-8C48-71A9668D62B3] (reporting strategy default)> on Task <7E8CD93C-FA67-4BD0-87BC-2D4670638102>.<104> was not selected for reporting
default	16:46:20.711483-0500	RedLemon	Task <3F5FD2D9-2E70-4B62-9E17-BF03D7D8C16E>.<103> finished successfully
default	16:46:20.711466-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.716006-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	16:46:20.716113-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9DE5C78C-8DBB-46B1-BCA4-949F776E28F3] (reporting strategy default)> on Task <BECF56E6-113D-4680-97FE-20E104700E86>.<106> was not selected for reporting
default	16:46:20.716204-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	16:46:20.716339-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	16:46:20.716594-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	16:46:20.714818-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4650EBB3-6E12-4648-9B04-7FC297FD974D] (reporting strategy default)> on Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> was not selected for reporting
default	16:46:20.716733-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.716845-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:20.717092-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.717535-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:20.717685-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:20.717844-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:20.717972-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	16:46:20.718077-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	16:46:20.718183-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.718280-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:20.718456-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.718782-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.719039-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.719549-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:46:20.719815-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:20.720014-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.720139-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:20.720252-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:20.720594-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:46:20.720787-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	16:46:20.720978-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	16:46:20.721105-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:20.721218-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	16:46:20.733475-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:20.734108-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	16:46:20.734648-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	16:46:20.736512-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:20.736922-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	16:46:20.737097-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:20.737281-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	16:46:20.737538-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	16:46:20.737787-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:46:20.738318-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:46:20.738446-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:46:20.738564-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	16:46:20.738662-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:46:20.738754-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	16:46:20.742750-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:20.742986-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> now using Connection 22
default	16:46:20.738847-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	16:46:20.744618-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.743304-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> sent request, body N 0
default	16:46:20.744436-0500	RedLemon	Task <7E8CD93C-FA67-4BD0-87BC-2D4670638102>.<104> summary for task success {transaction_duration_ms=25, response_status=200, cache_hit=true}
default	16:46:20.751027-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.751348-0500	RedLemon	Task <7E8CD93C-FA67-4BD0-87BC-2D4670638102>.<104> finished successfully
default	16:46:20.751713-0500	RedLemon	Task <BECF56E6-113D-4680-97FE-20E104700E86>.<106> summary for task success {transaction_duration_ms=31, response_status=200, cache_hit=true}
default	16:46:20.751909-0500	RedLemon	Task <BECF56E6-113D-4680-97FE-20E104700E86>.<106> finished successfully
default	16:46:20.751127-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752345-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752474-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752569-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752655-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752738-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752818-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752892-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.752969-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.753050-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.753124-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.755255-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.755408-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.757647-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.758086-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.758203-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.758296-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.758383-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.758465-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.758544-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.761496-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.761647-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.761744-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.761826-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:20.761903-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.761987-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.762885-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.762995-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.763107-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.763186-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.763259-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.763333-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.763406-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.768898-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.769150-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.769254-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.769341-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.769510-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.769877-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770008-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770109-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770299-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770418-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770554-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770687-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770781-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770865-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:20.770950-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 720p | 720p | comet
default	16:46:20.771450-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	16:46:20.771586-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 720p | 720p | comet
default	16:46:20.771680-0500	RedLemon	   INPUT[201]: [RD⚡] Comet 480p | 480p | comet
default	16:46:20.771764-0500	RedLemon	   INPUT[202]: [RD⚡] Comet unknown | unknown | comet
default	16:46:20.772095-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	16:46:20.772238-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	16:46:20.772418-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	16:46:20.772566-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	16:46:20.773044-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:20.775055-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0B38BC52-1010-4115-B382-CD9D2127A1F1] (reporting strategy default)> on Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> was not selected for reporting
default	16:46:20.777373-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:20.777645-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:46:20.777966-0500	RedLemon	Connection 23: enabling TLS
default	16:46:20.777998-0500	RedLemon	Connection 23: starting, TC(0x0)
default	16:46:20.778044-0500	RedLemon	[C23 81BE486E-EC2D-4D93-BFF6-660176FCA04B Hostname#2603e27a:443 quic-connection, url hash: 4522d48c, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:20.778119-0500	RedLemon	[C23 Hostname#2603e27a:443 initial path ((null))] event: path:start @0.000s
default	16:46:20.781986-0500	RedLemon	[C23 Hostname#2603e27a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: 5AEFD4A4-4281-4F39-A04E-A034BA996F0A
default	16:46:20.782156-0500	RedLemon	[C23 Hostname#2603e27a:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.004s
default	16:46:20.782190-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C23] reporting state preparing
default	16:46:20.782641-0500	RedLemon	[C23.1 Hostname#2603e27a:443 initial path ((null))] event: path:start @0.004s
default	16:46:20.783015-0500	RedLemon	[C23.1 Hostname#2603e27a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.004s, uuid: 5C6B9231-BA74-4F3E-BFFE-F897A8F7A961
default	16:46:20.783196-0500	RedLemon	[C23.1 Hostname#2603e27a:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.005s
default	16:46:20.783373-0500	mDNSResponder	[R3302] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'c65uhHHFQfpLki5mQn6jSw=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:20.783624-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> setting up Connection 23
default	16:46:20.785979-0500	RedLemon	nw_endpoint_resolver_update [C23.1 Hostname#2603e27a:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#b2b8b9f7.443
default	16:46:20.786083-0500	RedLemon	nw_endpoint_resolver_update [C23.1 Hostname#2603e27a:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60e0df7b:443
default	16:46:20.786200-0500	RedLemon	[C23.1 Hostname#2603e27a:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.008s
default	16:46:20.786390-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 initial path ((null))] event: path:start @0.008s
default	16:46:20.786721-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.008s, uuid: BD40DAE4-C0EB-4910-82C2-4E38AEB5C1B6
default	16:46:20.786845-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.008s
default	16:46:20.787384-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.009s
default	16:46:20.789203-0500	RedLemon	nw_protocol_instance_ignore_future_path_changes [C23.1.1:2] Ignoring future path changes for protocol
default	16:46:20.789694-0500	RedLemon	quic_initialize_block_invoke [C23.1.1:2] [-1521cfc14f9a3d47] created QUIC connection (spin bit disabled)
default	16:46:20.791299-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.013s
default	16:46:20.793354-0500	RedLemon	quic_crypto_new_flow [C23.1.1:2] [-1521cfc14f9a3d47] TLS stream is: [C24]
default	16:46:20.793401-0500	RedLemon	[C24 F65EB35E-A1A7-46BC-A715-A34D41E30C39 IPv6#b2b8b9f7.443 quic-connection, url hash: 4522d48c, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94, no transport] start
default	16:46:20.793503-0500	RedLemon	[C24 IPv6#b2b8b9f7.443 initial socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:start @0.000s
default	16:46:20.793600-0500	RedLemon	[C24 IPv6#b2b8b9f7.443 waiting socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: BD40DAE4-C0EB-4910-82C2-4E38AEB5C1B6
default	16:46:20.793757-0500	RedLemon	[C24 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.000s
default	16:46:20.793791-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C24] reporting state preparing
default	16:46:20.793908-0500	RedLemon	nw_flow_connected [C24 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	16:46:20.793957-0500	RedLemon	[C24 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.000s
default	16:46:20.794250-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C24:1][0x7f7b9cb90c00] TLS configured [min_version(0x0304) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:20.794349-0500	RedLemon	boringssl_context_info_handler(2028) [C24:1][0x7f7b9cb90c00] Client handshake started
default	16:46:20.794511-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS client enter_early_data
default	16:46:20.795968-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS client read_server_hello
error	16:46:20.810297-0500	RedLemon	quic_packet_parser_inner [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] SH fixed bit is zero
default	16:46:20.811460-0500	mDNSResponder	[R3302] getaddrinfo stop -- hostname: <mask.hash: 'c65uhHHFQfpLki5mQn6jSw=='>, client pid: 10341 (RedLemon)
default	16:46:20.811731-0500	RedLemon	nw_endpoint_resolver_update [C23.1 Hostname#2603e27a:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60e0df7b:443
default	16:46:20.811912-0500	RedLemon	[C23.1 Hostname#2603e27a:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.033s
default	16:46:20.812140-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:20.812230-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:20.812844-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client read_encrypted_extensions
error	16:46:20.813029-0500	RedLemon	quic_packet_parser_inner [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] SH fixed bit is zero
default	16:46:20.813466-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:20.813689-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:20.813750-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:20.814313-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C24:1][0x7f7b9cb90c00] Performing external trust evaluation
default	16:46:20.814502-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C24:1][0x7f7b9cb90c00] Asyncing for external verify block
default	16:46:20.814863-0500	RedLemon	Connection 23: asked to evaluate TLS Trust
default	16:46:20.815162-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> auth completion disp=1 cred=0x0
default	16:46:20.823983-0500	RedLemon	Connection 23: TLS Trust result 0
default	16:46:20.824031-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C24:1][0x7f7b9cb90c00] Returning from external verify block with result: true
default	16:46:20.824107-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C24:1][0x7f7b9cb90c00] Certificate verification result: OK
default	16:46:20.824455-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:20.824563-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:20.824596-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:20.824628-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:20.824660-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:20.825011-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS 1.3 client done
default	16:46:20.825122-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS client finish_client_handshake
default	16:46:20.825176-0500	RedLemon	boringssl_context_info_handler(2045) [C24:1][0x7f7b9cb90c00] Client handshake state: TLS client done
default	16:46:20.825212-0500	RedLemon	boringssl_context_info_handler(2034) [C24:1][0x7f7b9cb90c00] Client handshake done
default	16:46:20.825727-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C24:1][0x7f7b9cb90c00] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(31ms) flight_time(19ms) rtt(18ms) write_stalls(0) read_stalls(4)]
default	16:46:20.825829-0500	RedLemon	nw_flow_connected [C24 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	16:46:20.826003-0500	RedLemon	[C24 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.032s
default	16:46:20.826419-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C24] reporting state ready
default	16:46:20.826472-0500	RedLemon	[C24 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.033s
default	16:46:20.827394-0500	RedLemon	quic_pmtud_restart [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] PMTUD enabled, max PMTU: 1398, header size: 48, current PMTU 1248
default	16:46:20.827480-0500	RedLemon	quic_crypto_tls_ready_inner [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] QUIC connection established in 35.95 ms, RTT 14.819 ms
default	16:46:20.827543-0500	RedLemon	nw_flow_connected [C23.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	16:46:20.827728-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.049s
default	16:46:20.827843-0500	RedLemon	[C23.1 Hostname#2603e27a:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.049s
default	16:46:20.827897-0500	RedLemon	[C23 Hostname#2603e27a:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.049s
default	16:46:20.828030-0500	RedLemon	nw_flow_connected [C23.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:20.828294-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.050s
default	16:46:20.828460-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C23] reporting state ready
default	16:46:20.828537-0500	RedLemon	[C23.1 Hostname#2603e27a:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.050s
default	16:46:20.828568-0500	RedLemon	[C23 Hostname#2603e27a:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.050s
default	16:46:20.828681-0500	RedLemon	[C23.1.1 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.050s
default	16:46:20.828857-0500	RedLemon	[C23.1 Hostname#2603e27a:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.050s
default	16:46:20.828906-0500	RedLemon	[C23 Hostname#2603e27a:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.050s
default	16:46:20.829128-0500	RedLemon	Connection 23: connected successfully
default	16:46:20.829173-0500	RedLemon	Connection 23: TLS handshake complete
default	16:46:20.829412-0500	RedLemon	Connection 23: ready C(N) E(N)
default	16:46:20.830373-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> now using Connection 23
default	16:46:20.831489-0500	RedLemon	Connection 23: received viability advisory(Y)
default	16:46:20.831626-0500	RedLemon	0x7f7b9a3fdb38 ID=0 Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> sent request, body N 0
default	16:46:20.837153-0500	RedLemon	boringssl_context_new_session_handler(1336) [C24:1][0x7f7b9cb90c00] Asyncing for session update block
default	16:46:20.837388-0500	RedLemon	boringssl_context_new_session_handler(1336) [C24:1][0x7f7b9cb90c00] Asyncing for session update block
default	16:46:20.837480-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C24:1][0x7f7b9cb90c00] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(31ms) flight_time(19ms) rtt(18ms) write_stalls(0) read_stalls(4)]
default	16:46:20.837555-0500	RedLemon	nw_flow_connected [C24 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	16:46:20.838391-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C24:1][0x7f7b9cb90c00] Returning from session update block
default	16:46:20.838829-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C24:1][0x7f7b9cb90c00] Returning from session update block
default	16:46:20.838937-0500	RedLemon	quic_stream_create_inbound [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] creating inbound stream 3
default	16:46:20.839641-0500	RedLemon	quic_stream_create_inbound [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] creating inbound stream 7
default	16:46:20.840192-0500	RedLemon	quic_stream_create_inbound [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] creating inbound stream 11
default	16:46:20.844033-0500	RedLemon	quic_stream_create_inbound [C23.1.1:2] [-01a71a273bb457136aa7072787b4f4fd2181cb07] creating inbound stream 15
default	16:46:21.025156-0500	runningboardd	Invalidating assertion 166-10341-2552 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:21.026216-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> received response, status 200 content U
default	16:46:21.051234-0500	mDNSResponder	[R3301] getaddrinfo stop -- hostname: <mask.hash: 'd17ImWLdTvFdEb9kzi5JhA=='>, client pid: 10341 (RedLemon)
default	16:46:21.134083-0500	RedLemon	0x7f7b9a3fdb38 ID=0 Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> received response, status 200 content K
default	16:46:21.134706-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> response ended
default	16:46:21.135124-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> done using Connection 23
default	16:46:21.135631-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2554 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:21.135335-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> summary for task success {transaction_duration_ms=359, response_status=200, connection=23, protocol="h3", domain_lookup_duration_ms=3, connect_duration_ms=37, secure_connection_duration_ms=35, private_relay=false, request_start_ms=54, request_duration_ms=1, response_start_ms=358, response_duration_ms=1, request_bytes=166, response_bytes=1377, cache_hit=true}
default	16:46:21.135907-0500	runningboardd	Assertion 166-10341-2554 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:21.135694-0500	RedLemon	Task <86D02E82-9A75-4D35-8A4B-2867B3DAA250>.<107> finished successfully
default	16:46:21.137696-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:21.137742-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:21.137785-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:21.138019-0500	runningboardd	Attempting to rename power assertion 34227 for target anon<RedLemon>(501) to anon<RedLemon>(501);166-10341-2552:com.apple.CFNetwork.StorageDB;166-10341-2554:com.apple.CFNetwork.StorageDB
default	16:46:21.138468-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	16:46:21.138689-0500	RedLemon	✅ Filtered to 4 English subtitles
default	16:46:21.139072-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	16:46:21.139420-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	16:46:21.140213-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.140360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.140470-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.141091-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.141232-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.141475-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.142009-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.142414-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.142923-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.143105-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.143671-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.143868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.144520-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.145328-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.145555-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.145947-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.146095-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.146634-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.146770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.147039-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.147368-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.147574-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.148001-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.148422-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.148528-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.149112-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.149358-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.149714-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.150424-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.151110-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.151303-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.151700-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.151932-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.152378-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.152520-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.152698-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.152987-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.153103-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.153394-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.153531-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.153826-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.153959-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.154139-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.154530-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.154690-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.155323-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.155683-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.156045-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.157131-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.158262-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.158431-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.158730-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.158876-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.159133-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.159259-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.159717-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.159852-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.159960-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.160279-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.160422-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.160717-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.160974-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.161631-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.161892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.162015-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.162306-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.162445-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.162734-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.163758-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.168442-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.168937-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.169063-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.169389-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.169663-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.169776-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.170069-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.170216-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.170598-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.170758-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.171097-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.171226-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.171349-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.171653-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.171793-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.172092-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.172204-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.174220-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.174624-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.175617-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.176181-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.176657-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.176784-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.177177-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.177577-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.177895-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.178040-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.178510-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.178917-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.179040-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.179292-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.179421-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.190602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.190742-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.191137-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.191478-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.192928-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.193350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.193802-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.193931-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.194204-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.194461-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.194735-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.194869-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.195375-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.195509-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.195719-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.196012-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.197678-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.198724-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.200084-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.203694-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.205923-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.207499-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> done using Connection 22
default	16:46:21.207554-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.207696-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.208086-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.208229-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.208693-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> response ended
default	16:46:21.208906-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> summary for task success {transaction_duration_ms=488, response_status=200, connection=22, reused=1, request_start_ms=22, request_duration_ms=0, response_start_ms=305, response_duration_ms=182, request_bytes=483, response_bytes=6752, cache_hit=true}
default	16:46:21.208352-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.210728-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.210867-0500	RedLemon	Task <D7687D6B-F6DF-42D4-839C-327D622ED9B3>.<105> finished successfully
default	16:46:21.210899-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.211369-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.212443-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.212563-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.218802-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.219204-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.220438-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.220576-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.220840-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.220966-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.221558-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.222417-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.224586-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.224800-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.226037-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.226207-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.226339-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.226669-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.229324-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.229717-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.229824-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.229979-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.230117-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.230220-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.241102-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.241262-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.241519-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.241761-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.241877-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.242125-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.242259-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.244167-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.244463-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.250657-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.251014-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.251194-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.251465-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.251801-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.252119-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.252652-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.253103-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.254451-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.255980-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.256382-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.256598-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.256684-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.258028-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.258249-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.258379-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.256841-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 206
default	16:46:21.258699-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.258821-0500	RedLemon	   INPUT[0]: Frankenstein.2025.2160p.NF.WEB-DL.HDR.MULTi.DDP5.1.Atmos.H265-BEN.THE.MEN
👤 542 💾 36.27 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇷🇺 / 🇮🇹 / 🇵🇹 / 🇪🇸 / 🇫🇷 / 🇩🇪 / 🇮🇳 / 🇵🇱 / 🇺🇦 | 2160p | torrentio
default	16:46:21.258940-0500	RedLemon	   INPUT[1]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:46:21.259051-0500	RedLemon	   INPUT[2]: Frankenstein.2025.2160p.NF.WEB-DL.DV.P5.ENG.LATINO.DDP5.1.Atmos.MP4.H265-BTM
👤 109 💾 22.86 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio
default	16:46:21.259154-0500	RedLemon	   INPUT[3]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	16:46:21.259154-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.259435-0500	RedLemon	   INPUT[4]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:46:21.259562-0500	RedLemon	   INPUT[5]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	16:46:21.259665-0500	RedLemon	   INPUT[6]: Frankenstein (2025) [MULTi] [2160p] [NF] [WEB-DL] [HDR] [H265] [DDP5.1.Atmos-K83] [Lektor PL i Napisy PL]
👤 18 💾 21.81 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 2160p | torrentio
default	16:46:21.259763-0500	RedLemon	   INPUT[7]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	16:46:21.259854-0500	RedLemon	   INPUT[8]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	16:46:21.260281-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.261275-0500	RedLemon	   INPUT[9]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	16:46:21.261394-0500	RedLemon	   INPUT[10]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	16:46:21.261452-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.261502-0500	RedLemon	   INPUT[11]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:46:21.261562-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.261594-0500	RedLemon	   INPUT[12]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	16:46:21.261682-0500	RedLemon	   INPUT[13]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.DV.H.265-SNAKE
👤 35 💾 3 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.262229-0500	RedLemon	   INPUT[14]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.262339-0500	RedLemon	   INPUT[15]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.HDR.H.265-SNAKE
👤 12 💾 4.19 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.262439-0500	RedLemon	   INPUT[16]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	16:46:21.262533-0500	RedLemon	   INPUT[17]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.261826-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.266068-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.269556-0500	RedLemon	   INPUT[18]: Frankenstein.2025.1080p.WEB.h264-ETHEL
👤 175 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.269586-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.269736-0500	RedLemon	   INPUT[19]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	16:46:21.269875-0500	RedLemon	   INPUT[20]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	16:46:21.270073-0500	RedLemon	   INPUT[21]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.270210-0500	RedLemon	   INPUT[22]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.270304-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.270431-0500	RedLemon	   INPUT[23]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.270602-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.270631-0500	RedLemon	   INPUT[24]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
👤 122 💾 5.98 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:21.271544-0500	RedLemon	   INPUT[25]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:21.271611-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.271786-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.271816-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	16:46:21.272377-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.81 GB ⚙️ YTS | 1080p | torrentio
default	16:46:21.272696-0500	RedLemon	   INPUT[28]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	16:46:21.272691-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.273370-0500	RedLemon	   INPUT[29]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.274377-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.274653-0500	RedLemon	   INPUT[30]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:21.275794-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.275872-0500	RedLemon	   INPUT[31]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.276611-0500	RedLemon	   INPUT[32]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.276705-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.277074-0500	RedLemon	   INPUT[33]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.277137-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.277686-0500	RedLemon	   INPUT[34]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	16:46:21.278317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.278621-0500	RedLemon	   INPUT[35]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	16:46:21.279058-0500	RedLemon	   INPUT[36]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	16:46:21.279057-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.279797-0500	RedLemon	   INPUT[37]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	16:46:21.286003-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.287053-0500	RedLemon	   INPUT[38]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.287131-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.287559-0500	RedLemon	   INPUT[39]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:21.293519-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.293885-0500	RedLemon	   INPUT[40]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.294202-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.295813-0500	RedLemon	   INPUT[41]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.297462-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.297506-0500	RedLemon	   INPUT[42]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:21.297626-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.298023-0500	RedLemon	   INPUT[43]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:21.298055-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.298396-0500	RedLemon	   INPUT[44]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:21.299932-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.300784-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.300769-0500	RedLemon	   INPUT[45]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	16:46:21.301904-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.302119-0500	RedLemon	   INPUT[46]: Frankenstein (2025) [MULTi] [1080p] [NF] [WEB-DL] [H264] [DDP5.1.Atmos-K83[ [Lektor PL i Napisy PL]
👤 9 💾 6.66 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 1080p | torrentio
default	16:46:21.302565-0500	RedLemon	   INPUT[47]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	16:46:21.302930-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.303112-0500	RedLemon	   INPUT[48]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.303204-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.303358-0500	RedLemon	   INPUT[49]: Frankenstein.2025.WEB-DL.1080p-Dual-Lat
👤 7 💾 6.8 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	16:46:21.304238-0500	RedLemon	   INPUT[50]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	16:46:21.304270-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.304567-0500	RedLemon	   INPUT[51]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.304789-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.305691-0500	RedLemon	   INPUT[52]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.308448-0500	RedLemon	   INPUT[53]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.308696-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.308867-0500	RedLemon	   INPUT[54]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:46:21.309431-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.309833-0500	RedLemon	   INPUT[55]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:46:21.310545-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.310838-0500	RedLemon	   INPUT[56]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.311415-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.311708-0500	RedLemon	   INPUT[57]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:46:21.313463-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.314776-0500	RedLemon	   INPUT[58]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:21.315321-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.315344-0500	RedLemon	   INPUT[59]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:46:21.317096-0500	RedLemon	   INPUT[60]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	16:46:21.318516-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.318542-0500	RedLemon	   INPUT[61]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	16:46:21.319067-0500	RedLemon	   INPUT[62]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:21.319067-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.319227-0500	RedLemon	   INPUT[63]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	16:46:21.319377-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.319577-0500	RedLemon	   INPUT[64]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:21.319700-0500	RedLemon	   INPUT[65]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	16:46:21.319941-0500	RedLemon	   INPUT[66]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	16:46:21.320019-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.320132-0500	RedLemon	   INPUT[67]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:46:21.320135-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.320348-0500	RedLemon	   INPUT[68]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	16:46:21.320456-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.320664-0500	RedLemon	   INPUT[69]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:46:21.321065-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.321044-0500	RedLemon	   INPUT[70]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	16:46:21.321439-0500	RedLemon	   INPUT[71]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	16:46:21.321438-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.321561-0500	RedLemon	   INPUT[72]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:46:21.323211-0500	RedLemon	   INPUT[73]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:46:21.323520-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.325846-0500	RedLemon	   INPUT[74]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:46:21.326595-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.326988-0500	RedLemon	   INPUT[75]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	16:46:21.327734-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.328072-0500	RedLemon	   INPUT[76]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:46:21.328587-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.328996-0500	RedLemon	   INPUT[77]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	16:46:21.329404-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.329638-0500	RedLemon	   INPUT[78]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	16:46:21.329833-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.330100-0500	RedLemon	   INPUT[79]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	16:46:21.330698-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.331887-0500	RedLemon	   INPUT[80]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	16:46:21.333565-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.334714-0500	RedLemon	   INPUT[81]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	16:46:21.340526-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.341695-0500	RedLemon	   INPUT[82]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	16:46:21.341877-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.342220-0500	RedLemon	   INPUT[83]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	16:46:21.342657-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.342936-0500	RedLemon	   INPUT[84]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	16:46:21.343107-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.343302-0500	RedLemon	   INPUT[85]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	16:46:21.343611-0500	RedLemon	   INPUT[86]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	16:46:21.343718-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.344151-0500	RedLemon	   INPUT[87]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	16:46:21.344180-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.344752-0500	RedLemon	   INPUT[88]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	16:46:21.345174-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.345432-0500	RedLemon	   INPUT[89]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	16:46:21.345606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.345915-0500	RedLemon	   INPUT[90]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	16:46:21.346745-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.346926-0500	RedLemon	   INPUT[91]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	16:46:21.348520-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.352294-0500	RedLemon	   INPUT[92]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	16:46:21.352881-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.353760-0500	RedLemon	   INPUT[93]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	16:46:21.354473-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.354707-0500	RedLemon	   INPUT[94]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	16:46:21.356163-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.357188-0500	RedLemon	   INPUT[95]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	16:46:21.358620-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.359319-0500	RedLemon	   INPUT[96]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	16:46:21.359910-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.359963-0500	RedLemon	   INPUT[97]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	16:46:21.360378-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.360647-0500	RedLemon	   INPUT[98]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	16:46:21.360838-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.361108-0500	RedLemon	   INPUT[99]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	16:46:21.361407-0500	RedLemon	   INPUT[100]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	16:46:21.361687-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.361927-0500	RedLemon	   INPUT[101]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	16:46:21.361990-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.362396-0500	RedLemon	   INPUT[102]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	16:46:21.362445-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.363040-0500	RedLemon	   INPUT[103]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	16:46:21.363550-0500	RedLemon	   INPUT[104]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	16:46:21.370573-0500	RedLemon	   INPUT[105]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	16:46:21.370747-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.371020-0500	RedLemon	   INPUT[106]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	16:46:21.371022-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.371218-0500	RedLemon	   INPUT[107]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	16:46:21.371592-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.371829-0500	RedLemon	   INPUT[108]: FRANKENSTEIN mkv | Unknown | zilean
default	16:46:21.372420-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.373205-0500	RedLemon	   INPUT[109]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	16:46:21.376328-0500	RedLemon	   INPUT[110]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	16:46:21.377130-0500	RedLemon	   INPUT[111]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	16:46:21.377526-0500	RedLemon	   INPUT[112]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	16:46:21.377729-0500	RedLemon	   INPUT[113]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	16:46:21.378071-0500	RedLemon	   INPUT[114]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	16:46:21.378274-0500	RedLemon	   INPUT[115]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	16:46:21.379157-0500	RedLemon	   INPUT[116]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	16:46:21.379638-0500	RedLemon	   INPUT[117]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	16:46:21.381170-0500	RedLemon	   INPUT[118]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	16:46:21.381686-0500	RedLemon	   INPUT[119]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	16:46:21.381906-0500	RedLemon	   INPUT[120]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	16:46:21.382106-0500	RedLemon	   INPUT[121]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	16:46:21.382308-0500	RedLemon	   INPUT[122]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	16:46:21.382497-0500	RedLemon	   INPUT[123]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	16:46:21.382692-0500	RedLemon	   INPUT[124]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	16:46:21.384681-0500	RedLemon	   INPUT[125]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	16:46:21.385130-0500	RedLemon	   INPUT[126]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	16:46:21.386121-0500	RedLemon	   INPUT[127]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	16:46:21.386609-0500	RedLemon	   INPUT[128]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	16:46:21.387603-0500	RedLemon	   INPUT[129]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	16:46:21.389863-0500	RedLemon	   INPUT[130]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	16:46:21.390248-0500	RedLemon	   INPUT[131]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	16:46:21.390522-0500	RedLemon	   INPUT[132]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	16:46:21.391123-0500	RedLemon	   INPUT[133]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	16:46:21.391386-0500	RedLemon	   INPUT[134]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	16:46:21.391592-0500	RedLemon	   INPUT[135]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	16:46:21.392131-0500	RedLemon	   INPUT[136]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	16:46:21.393357-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.393819-0500	RedLemon	   INPUT[137]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	16:46:21.393716-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.394124-0500	RedLemon	   INPUT[138]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	16:46:21.394695-0500	RedLemon	   INPUT[139]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	16:46:21.394870-0500	RedLemon	   INPUT[140]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	16:46:21.395198-0500	RedLemon	   INPUT[141]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	16:46:21.395384-0500	RedLemon	   INPUT[142]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	16:46:21.395649-0500	RedLemon	   INPUT[143]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	16:46:21.395831-0500	RedLemon	   INPUT[144]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	16:46:21.396102-0500	RedLemon	   INPUT[145]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	16:46:21.396397-0500	RedLemon	   INPUT[146]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	16:46:21.396610-0500	RedLemon	   INPUT[147]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	16:46:21.396867-0500	RedLemon	   INPUT[148]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	16:46:21.397011-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.397113-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.397207-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.397294-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.397377-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.397455-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.397615-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398149-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398281-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398387-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398502-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398603-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398699-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398786-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.398948-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.399051-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.399305-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.399718-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.399818-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.399914-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.400001-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.400187-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.400320-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.400418-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.400507-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.400732-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	16:46:21.400979-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.401376-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.401549-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.402070-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.402242-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.402362-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.402822-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.402916-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.403024-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.403100-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.403175-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.403249-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.403318-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.406032-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.406192-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.406497-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.406626-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.406652-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.406794-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.407046-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.407201-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.407299-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.407390-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.407531-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.407646-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 1080p | 1080p | comet
default	16:46:21.407743-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 720p | 720p | comet
default	16:46:21.407836-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	16:46:21.408011-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 720p | 720p | comet
default	16:46:21.407788-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.408361-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.408476-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.408222-0500	RedLemon	   INPUT[201]: [RD⚡] Comet 480p | 480p | comet
default	16:46:21.408828-0500	RedLemon	   INPUT[202]: [RD⚡] Comet unknown | unknown | comet
default	16:46:21.408850-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.408925-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	16:46:21.408958-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.409017-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	16:46:21.409056-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.409090-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	16:46:21.410393-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	16:46:21.411361-0500	RedLemon	Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:21.412133-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [66CF186C-C049-4B54-8D54-C60A3D0E6B6D] (reporting strategy default)> on Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> was not selected for reporting
default	16:46:21.413228-0500	RedLemon	Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:21.413506-0500	RedLemon	Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> now using Connection 23
default	16:46:21.414398-0500	RedLemon	0x7f7b9ccebd88 ID=4 Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> sent request, body N 0
default	16:46:21.415376-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.416179-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.416575-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.416718-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.417033-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.418040-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.418811-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.419024-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.419195-0500	runningboardd	Attempting to rename power assertion 34227 for target anon<RedLemon>(501) to anon<RedLemon>(501)166-10341-2554:com.apple.CFNetwork.StorageDB
default	16:46:21.420562-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.420661-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.420821-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.420890-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.421027-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.421111-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.421983-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.422132-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.422234-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.422729-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.422873-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.423053-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.423487-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.423648-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.424146-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.424274-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.424513-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.424954-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.425343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.425483-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.425894-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.426074-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.426573-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.426709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.426923-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.427365-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.427505-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.427629-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.428072-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.428232-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.428440-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:21.428481-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:21.428519-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:21.429172-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.429277-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.431415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.432775-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.433307-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.434012-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.436599-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.436868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.436985-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.437654-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.437819-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.438559-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.438750-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.439263-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.439424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.439701-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.440170-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.440330-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.440563-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.440824-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.440917-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.441066-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.441138-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.441190-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.441323-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.441986-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.442156-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.442825-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.443036-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.443572-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.443743-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.444153-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.444683-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.444885-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.445085-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.445560-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.445724-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.446162-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.446538-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.447875-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.448075-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.448451-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.448647-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.448991-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.449177-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.449301-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.449630-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.449790-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.451889-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.452234-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.453835-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.454097-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.454328-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.455493-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.455657-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.455785-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.456188-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.456365-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.456764-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.456903-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.457302-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.457591-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.457720-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.458286-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.458858-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.459049-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.459398-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.459503-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.459564-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.461615-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.461833-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.462156-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.462958-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.464569-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.465024-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.465544-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.465981-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.466460-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.466840-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.467025-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.467849-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.468218-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.469446-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.469660-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.471713-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.471937-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.473299-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.473717-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.474245-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.474411-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.475024-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.475701-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.476769-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.476942-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.477313-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.477802-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.477956-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.478076-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.478579-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.478771-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.479504-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.479842-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.480498-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.480690-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.481014-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.481259-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.482105-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.482249-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.482665-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.483195-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.483402-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.485043-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.485214-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.487139-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.487355-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.489013-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.489440-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.490147-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.490494-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.490725-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.491060-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.491197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.491316-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.491682-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.491852-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.492239-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.492342-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.492408-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.492572-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.492636-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.492693-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.492832-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.493845-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.494266-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.494426-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.494719-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.494856-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.494982-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.495340-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.495568-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.496156-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.496294-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.496392-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.496726-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.496881-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.496995-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.497303-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.497473-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.497787-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.497940-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.498069-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.498383-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.498548-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.498681-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.500108-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.502571-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.508779-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.508951-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.509736-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.510081-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.510216-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.510348-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.510631-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.510766-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.512366-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.512526-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.512918-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.528004-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.528182-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.528306-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.529589-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.536735-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.538957-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.540261-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.540699-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.541320-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.541460-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.542639-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.543265-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.543425-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.544404-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.550771-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.551086-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.551904-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.554795-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.557344-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.558520-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.559376-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.560004-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.560175-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.560300-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.561009-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.561157-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.561424-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.562006-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.562176-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.562794-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.562944-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.563060-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.564388-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.564574-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.565718-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.567183-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.567446-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.568543-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.568763-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.568983-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.569808-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.570123-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.571314-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.574462-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.574696-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.576257-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.576443-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.577419-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.578347-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.578526-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.578924-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.579982-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.580492-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.584368-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.584760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.584933-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.585783-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.586138-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.586365-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.588496-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.588920-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.589828-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.590049-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.590320-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.591943-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.592137-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.592279-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.593132-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.593319-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.593792-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.593982-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.594088-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.594594-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.594893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.595288-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.596754-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.597002-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.597367-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.597872-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.598030-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.598383-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.598545-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.599211-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.599637-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.599819-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.600714-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.600857-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.601394-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.602155-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.602920-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.604630-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.607013-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.607882-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.608062-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.608757-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.609143-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.609385-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.610474-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.610673-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.611589-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.612252-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.612869-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.613102-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.613445-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.614072-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.614237-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.614717-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.614864-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.615571-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.616146-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.618118-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.618309-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.618722-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.618882-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.619287-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.619612-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.620421-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.620668-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.621066-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.624716-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.625421-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.625652-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.626012-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.626705-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.626920-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.627840-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.628375-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.628711-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.629467-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.630187-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.630542-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.630914-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.632349-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.632642-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.635231-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.635521-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.637737-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.637981-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.638395-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.638659-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.639832-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.640497-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.641243-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.642169-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.642564-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.642874-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.643213-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.643357-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.643758-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.643893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.644289-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.644645-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.644794-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.645242-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.645498-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.647133-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.647294-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.647418-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.647764-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.647937-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.648072-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.648386-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.648561-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.648868-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.649836-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.650248-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.651092-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.651268-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.651736-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.651889-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.652117-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.652509-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.652638-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.652764-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.653094-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.653250-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.653589-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.653758-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.653866-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.654414-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.654572-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.654722-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.655085-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.655366-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.655745-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.655922-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.656033-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.656339-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.656646-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.657192-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.657327-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.658030-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.658196-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.658369-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.659167-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.659432-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.659742-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.660406-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.660689-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.660824-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.661215-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.661360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.661459-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.661828-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.662000-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.662365-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.662548-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.662707-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.663077-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.663252-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.663949-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.664127-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.664252-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.664573-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.664752-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.665556-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.666815-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.666997-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.667783-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.668251-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.668561-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.669301-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.669544-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.670089-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.670321-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.670903-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.671533-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.672079-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.672266-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.673491-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.674012-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.674587-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.674819-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.675170-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.675538-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.675708-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.676119-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.676296-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.677124-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.677356-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.677468-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.677779-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.678040-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.678370-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.678679-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.679558-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.680047-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.680175-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.681010-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.681521-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.681711-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.682154-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.682313-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.682708-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.682832-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.683140-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.683279-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.683520-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.684416-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.684614-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.685199-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.685489-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.685674-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.686184-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.686342-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.686465-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.686820-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.686992-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.687490-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.687700-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.687825-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.688210-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.688558-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.689106-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.689446-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.690102-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.690403-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.690807-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.690969-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.691224-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.691798-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.692109-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.692308-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.692814-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.692991-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.693105-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.693531-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.693845-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.694277-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.694869-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.695151-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.695789-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.696119-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.696254-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.696803-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.696952-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.697119-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.697876-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.698286-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.698698-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.699712-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.699896-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.700005-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.700516-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.700752-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.701097-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.701270-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.701414-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.701862-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.702038-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.702379-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.702523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.702804-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.703177-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.703361-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.703516-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.704343-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.704466-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.704526-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.704741-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.704817-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.705028-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.705421-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.705636-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.705805-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.706295-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.706454-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.706559-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.706837-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.706989-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.707298-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.707458-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.707892-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.708061-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.708431-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.708550-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.708672-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.709023-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.709234-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.709377-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.709744-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.709896-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.710516-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.710691-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.711000-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.711574-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.711882-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.712053-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.712408-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.712570-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.712672-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.713044-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.713321-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.713629-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.714020-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.714180-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.714508-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.714670-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.714777-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.715063-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.715199-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.715315-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.715625-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.715747-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.716598-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.716770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.716880-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.717262-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.717417-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.717542-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.717901-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.718102-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.718256-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.718781-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.718949-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.719144-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.719746-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.719991-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.720422-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.720593-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.721028-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.721709-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.721986-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.722120-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.722534-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.722821-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.723243-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.723423-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.723925-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.724092-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.724206-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.724590-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.724737-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.724867-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.725200-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.725397-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.725538-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.726154-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.726484-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.726794-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.726918-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.727029-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.727339-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.727572-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.727977-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.728199-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.728621-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.728820-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.729053-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.729636-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.729821-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.730603-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.730770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.730871-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.731412-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.732270-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.732625-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.732996-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.733309-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.733490-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.734153-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.734322-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.734499-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.735153-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.735599-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.736843-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.738096-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.738797-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.739847-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.740003-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.740396-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.740508-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.740708-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.741102-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.741321-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.741472-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.741854-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.741962-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.742352-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.742481-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.743210-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.743381-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.743936-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.744349-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.744473-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.744826-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.745037-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.745188-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.745646-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.745764-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.746140-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.746288-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.746773-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.746975-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.747257-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.747729-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.748456-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.749377-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.750215-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.751964-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.753051-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.753302-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.754475-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.755795-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.756830-0500	RedLemon	0x7f7b9ccebd88 ID=4 Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> received response, status 200 content K
default	16:46:21.756336-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.757548-0500	RedLemon	Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> response ended
default	16:46:21.757900-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.758728-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.759144-0500	RedLemon	Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> done using Connection 23
default	16:46:21.759660-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	16:46:21.759670-0500	RedLemon	Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> summary for task success {transaction_duration_ms=347, response_status=200, connection=23, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=344, response_duration_ms=2, request_bytes=166, response_bytes=1381, cache_hit=true}
default	16:46:21.760224-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.760529-0500	RedLemon	Task <F136B33B-B58A-42F6-BBE6-38FED50B84C3>.<108> finished successfully
default	16:46:21.760888-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.761368-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.761729-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.761914-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.762023-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	16:46:21.762141-0500	RedLemon	✅ Filtered to 4 English subtitles
default	16:46:21.762347-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	16:46:21.762454-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	16:46:21.762722-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.762845-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.763225-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.763128-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.763370-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.763725-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.763849-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.764067-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.764133-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.764292-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.764367-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.764949-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.765429-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.766321-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.766349-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.766613-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.766743-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.767049-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.767098-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.767189-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.767241-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.767714-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.768009-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.768065-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.768191-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.768534-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.768562-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.768718-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.768897-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.769315-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.769426-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.769438-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.769809-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.769941-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.770248-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.770263-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.770418-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.770529-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.770646-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.771133-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.771254-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.771692-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.771887-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.772228-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.772367-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.772769-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.772815-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.772895-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.773215-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.773344-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.773648-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.773648-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.773834-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.773968-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.774235-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.774293-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.774390-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.774657-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.774749-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.774782-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.775053-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.775194-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.775322-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.775615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.775729-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.776063-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.776199-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.776475-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.776659-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.776665-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.776890-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.777220-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.777306-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.777333-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.777661-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.777673-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.777976-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.778114-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.778413-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.778549-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.778857-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.778984-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.779144-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.779315-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.779504-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.779624-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.779593-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.780318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.780455-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.781038-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.780459-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.781193-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.781531-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.781721-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.781864-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.782159-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.782242-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.782538-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.782536-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.782829-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.782845-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.783006-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.783360-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.783525-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.783795-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.783864-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.783924-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.784032-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.784308-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.784399-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.784440-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.784842-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.784842-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.785005-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.785293-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.785340-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.785429-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.785537-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.785845-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.785978-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.786176-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.786395-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.786436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.786686-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.786806-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.786844-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.786906-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.787163-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.787307-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.787548-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.787674-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.787831-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.787686-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.788228-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.788379-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.788759-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.788935-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.789017-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.789287-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.789381-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.789555-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.789685-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.789875-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.789963-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.790096-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.790174-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.790416-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.790488-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.790548-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.790846-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.790980-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.791181-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.791462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.791574-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.791862-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.792002-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.792098-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.792222-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.792359-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.792489-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.792782-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.792830-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.792923-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.793018-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.793184-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.793271-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.793385-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.793406-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.793493-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.793781-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.793910-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.794174-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.794183-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.794318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.794414-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.794469-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.794677-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.794781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.794857-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.795137-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.795233-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.795273-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.795583-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.796303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.796564-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.796931-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.797334-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.797409-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.798027-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.798074-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.798237-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.799237-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.799575-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.799746-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.800127-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.800323-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.800333-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.800617-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.800906-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.801131-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.802153-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.802429-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.802659-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.802700-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.802866-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.803405-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.803483-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.803597-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.803608-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.803913-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.804380-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.804680-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.805310-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.805505-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.805707-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.805788-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.806480-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.806648-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.807230-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.807683-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.807816-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.807964-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.808181-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.808286-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.808337-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.808778-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.809096-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.809432-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.809498-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.810030-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.810360-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.810580-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.810853-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.810976-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.811124-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.811273-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.811779-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.812000-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.812170-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.812813-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.813091-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.813127-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.813776-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.813939-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.814263-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.814632-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.814876-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.815123-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.815486-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.815565-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.815676-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.816040-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.817876-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.818455-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.818866-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.819159-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.819720-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.819813-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.819900-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.820261-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.820399-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.820715-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.821065-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.821245-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.821445-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.821458-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.822050-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.822241-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.822362-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.822422-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.823134-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.823378-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.823488-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.823587-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.823646-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.824172-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.824299-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.824321-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.824577-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.824776-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.825037-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.825203-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.825481-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.825951-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.826176-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.825613-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.826344-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.826344-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.826924-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.827002-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.827209-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.827228-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.827619-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.827670-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.827816-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.828341-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.828499-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.828634-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.829055-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.829144-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.829196-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.829478-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.829617-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.829853-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.830142-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.830261-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.830651-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.830723-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.831027-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.831089-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.831496-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.831815-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.832099-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.832220-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.832604-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.832931-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.833149-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.834072-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.834395-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.834652-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.835362-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.835669-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.836039-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.836287-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.837029-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.837157-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.837892-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.838538-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.838538-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.839401-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.840362-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.840550-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.840869-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.841033-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.841145-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.841233-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.841685-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.841685-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.841854-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.841952-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.842511-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.842511-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.843061-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.843100-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.843188-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.843641-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.843719-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.843766-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.844072-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.844230-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.844326-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.844389-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.845041-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.845247-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.845396-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.845515-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.845958-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.846242-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.846235-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.846796-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.846957-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.847134-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.847291-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.847652-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.847881-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.848227-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.848423-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.848521-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.848923-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.848813-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.849332-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.849786-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.850020-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.850085-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.850898-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.851334-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.851406-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.851536-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.851687-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.851886-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.852058-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.852200-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.852561-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.852832-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.852835-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.853238-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.853238-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.853430-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.853550-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.853981-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.854204-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.854552-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.854512-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.854799-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.855684-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.855704-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.855880-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.855899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.856221-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.856458-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.856641-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.856983-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.857211-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.857244-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.857372-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.857779-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.857917-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.858186-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.858342-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.858464-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.858452-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.858762-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.859106-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.859149-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.859225-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.859376-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.859551-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.860301-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.860620-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.860707-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.861224-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.861396-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.861531-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.861810-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.862091-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.862291-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.862709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.862709-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.862852-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.863006-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.863261-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.863284-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.863771-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.863926-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.864551-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.864551-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.864715-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.866650-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.866818-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.867031-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.867403-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.867602-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.867634-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.867818-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.868189-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.868462-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.868695-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.868865-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.868999-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.869129-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.869525-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.869879-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.870379-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.869927-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.871093-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.871609-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.871674-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.871754-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.874021-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.879694-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.887177-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.888784-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.888973-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.890152-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.890696-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.891020-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.891973-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.890460-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.892389-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.893416-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.897252-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.897646-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.897826-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.898121-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.898272-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.898413-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.898775-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.898976-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.899375-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.904733-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.904895-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.907382-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.908112-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.909063-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.909418-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.910835-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.911180-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.912400-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.912400-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.912580-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.912911-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.913116-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.913621-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.913717-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.913866-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.914056-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.914299-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.914338-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.914805-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.914803-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.915071-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.915585-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.915467-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.915764-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.915894-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.916270-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.916220-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.916487-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.916729-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.917104-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.917418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.917620-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.918087-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.918229-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.918538-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.918695-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.918819-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.918951-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.918951-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.919564-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.919646-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.919888-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.919923-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.920223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.920340-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.920298-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.924082-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.923402-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.924348-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.924525-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.924761-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.924983-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.925071-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.925460-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.925546-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.925671-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.926004-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.926184-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.926398-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.926408-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.926557-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.926656-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.927156-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.927306-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.927588-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.928276-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.928428-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.928555-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.928980-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.929406-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.929757-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.929841-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.929987-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.930061-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.930077-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.930155-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.930402-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.930516-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.930799-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.930958-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.931807-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.931876-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.932034-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.934134-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.934091-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.935651-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.935651-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.936052-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.936059-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.936249-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.936748-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.936748-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.937014-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.937709-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.937951-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.938246-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.938400-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.939209-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.939563-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.939563-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.939855-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.940527-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.940565-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.940681-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.940681-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.940783-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.941209-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.941476-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.941510-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.941979-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.941979-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.942312-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.942436-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.942610-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.942822-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.942822-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.942987-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.943370-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.943378-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.943528-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.943677-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.943829-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.944171-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.944180-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.944292-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.944631-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.944658-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.944979-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.945002-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.945543-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.945724-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.946208-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.946414-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.946696-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.946811-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.946826-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.946959-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.947297-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.947307-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.947432-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.947628-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.947856-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.947891-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.948339-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.948395-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.948636-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.948872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.948873-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.949320-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.949371-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.949517-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.949610-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.949722-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.949778-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.949892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.949969-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.949995-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.950535-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.950735-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.950805-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.950867-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.950921-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.951178-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.951221-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.951371-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.951420-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.951530-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.951567-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.951634-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.951643-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.951705-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.951862-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.951883-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.951937-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.951996-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.952187-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.952359-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.952253-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.952466-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.952544-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.952769-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.952956-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.953140-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.953141-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.953269-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.953377-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.953496-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.953825-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.953915-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.953979-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.954087-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.954452-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.954575-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.954879-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.954893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.955054-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.955702-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.956074-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.956485-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.956635-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.956651-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.956800-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.956748-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.957401-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.957461-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.957575-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.957587-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.957819-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.958302-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.958415-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.958436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.958611-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.958700-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.959047-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.959197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.959362-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.959415-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.959556-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.959722-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.959785-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.959862-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.960556-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.960565-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.960984-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.960978-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.961270-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.961214-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.961771-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.961833-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.961908-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.961946-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.962011-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.962326-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.962589-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.962632-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.962838-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.962981-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.963253-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.963413-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.963474-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.963561-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.964018-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.964040-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.964165-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.964484-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.964575-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.964648-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.964874-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.965987-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.966116-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.966923-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.967102-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.967391-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.967559-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.967803-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.968009-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.968127-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.968424-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.968611-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.968719-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.968719-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.968838-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.969379-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.969443-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.969541-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.969604-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.969727-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.970007-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.970040-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.970135-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.970136-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.970221-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.970621-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.970674-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.970776-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.971259-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.971339-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.971491-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.972505-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.974196-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.974311-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.974734-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.974891-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.974998-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.975313-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.975644-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.975784-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.975781-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.975897-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.976775-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.976927-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.976968-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.977066-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.977066-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.977550-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.977698-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.977719-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.977796-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.978238-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.978322-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.978372-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.978471-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.978765-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.979129-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.979301-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.979377-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.979554-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.979554-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.979701-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.979896-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.980108-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.980240-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.980567-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.980746-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.980773-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.981039-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.981348-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.981633-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.981986-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.982424-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.982477-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.982587-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.982603-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.982832-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.982881-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.982953-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.983174-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.983308-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.983112-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.983818-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.983829-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.983956-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.984050-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.984352-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.984734-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.984803-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.984906-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.984920-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.985197-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.985318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.985423-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.985786-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.985820-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.986175-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.986315-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.986474-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.986617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.986757-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.986881-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.986943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.987045-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.987131-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.987313-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.987637-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.987713-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.987798-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.988003-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.988348-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.988429-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.988544-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.988835-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.989068-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.989089-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.989469-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.989521-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:21.989645-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.989686-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:21.989800-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.989917-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.990036-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.990061-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.990379-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.990398-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.990540-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.991214-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.991240-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.991396-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.991519-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.991415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.991767-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.991894-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.992186-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.992458-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.992531-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.992619-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.992665-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.992744-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.992898-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.992963-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.993010-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.993338-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.993709-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.993947-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.994210-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.994344-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.994461-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.994529-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.994606-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.994978-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.994992-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.995125-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.995419-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.995671-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.995783-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.995897-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.996366-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.996414-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.996519-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.996619-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.996742-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.996855-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.996862-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.996968-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.997257-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.997337-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.997374-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:21.997461-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.997653-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.997797-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.998209-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:21.998434-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:21.998465-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.998586-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:21.998645-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:21.999175-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:21.999300-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:21.999350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.999573-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.999689-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.999689-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.999866-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.001806-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:22.002347-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:22.002837-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.007812-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.008979-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.009160-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.009273-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.010329-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.010531-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.011069-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.011327-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.011440-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.011904-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.012275-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.012756-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.023338-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.023993-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.026195-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.026880-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.027154-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.027178-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.028064-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.029299-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.030463-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:22.030786-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:22.040396-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.041707-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.042918-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.043323-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.044599-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:22.045249-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:22.046364-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.047530-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.054292-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.054435-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.054750-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.055790-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.055980-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.056296-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.056543-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.056622-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:22.056974-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:22.057125-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.057075-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.057502-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.057634-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.057996-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.058129-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.058295-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.058358-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.058406-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.058649-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.058893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.058962-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.059029-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.059258-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.059716-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.060231-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.060681-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.060677-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:22.060867-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:22.061008-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.061197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.061609-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.062448-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.062483-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.062594-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.062603-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.062877-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.063123-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.063733-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.063880-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.064207-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.065732-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.065741-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.066190-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.066371-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.066849-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.067096-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.067424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.067650-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.067981-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.068913-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.069598-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.070658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.070702-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.071027-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.071223-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.073489-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.073998-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.074035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.074125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.074158-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.074223-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.074737-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.074798-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.074893-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.074930-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.075256-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.075293-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.075372-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.075560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.075670-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.075886-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.076087-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.076419-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.076462-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.076572-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.076594-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.076914-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.077022-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.077197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.077357-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.077457-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.077493-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.078200-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.078352-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.078387-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.078493-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.079191-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.079210-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.079340-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.079319-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.079740-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.079868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.079919-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.080533-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.080715-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.081082-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.081082-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.081332-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.081648-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.081779-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.081887-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.082118-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.082225-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.082267-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.082564-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.082607-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.082681-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.083235-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.083283-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.083396-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.083504-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.083916-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.084057-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.084362-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.084494-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.084883-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.085047-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.085169-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.085184-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.085282-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 206
default	16:46:22.085649-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.085886-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	16:46:22.086136-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.086200-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.086364-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.086441-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.086505-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.086730-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.086817-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.086958-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.087177-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.087348-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.087671-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.087681-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.087842-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.088046-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.088572-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	16:46:22.089076-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.089513-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.089867-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.090015-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.090154-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.090368-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.090759-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	16:46:22.090903-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.090934-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.091094-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.091352-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.091603-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.091542-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.091804-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.091958-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	16:46:22.092186-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.092231-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.092315-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.092386-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	16:46:22.092531-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.092741-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	16:46:22.092988-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.092905-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.093240-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.093399-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.093727-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.094301-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	16:46:22.094544-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.094630-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	16:46:22.094736-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.094779-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	16:46:22.095067-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.095356-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.095577-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.095654-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	16:46:22.095707-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.095803-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	16:46:22.096065-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.096239-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	16:46:22.096462-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.096715-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	16:46:22.097045-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	16:46:22.097075-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.097691-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	16:46:22.097856-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	16:46:22.098222-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.099394-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.099653-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	16:46:22.100595-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	16:46:22.100810-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.101006-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.100703-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.101176-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.101419-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	16:46:22.101605-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.101799-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.102031-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.102241-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.102420-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.102698-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.102701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.102880-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	16:46:22.103046-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.103144-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.103311-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	16:46:22.103468-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.103641-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.103813-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.104031-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	16:46:22.104269-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	16:46:22.104232-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.104532-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.104691-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	16:46:22.104837-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.104995-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.105142-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.105287-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.105521-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.104707-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.106237-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.106549-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.106761-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.106820-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.107109-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.107280-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	16:46:22.107434-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.107306-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.107980-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.108048-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.108177-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.108391-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	16:46:22.108432-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.108673-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	16:46:22.108843-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	16:46:22.109004-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.109136-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.109152-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.109245-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.109272-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	16:46:22.109386-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	16:46:22.109550-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	16:46:22.110272-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	16:46:22.110414-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.110493-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	16:46:22.110954-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.111126-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	16:46:22.111361-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	16:46:22.111643-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	16:46:22.111671-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.111787-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.111783-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	16:46:22.111886-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.111989-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	16:46:22.112204-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.112512-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	16:46:22.112714-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.112900-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	16:46:22.113092-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	16:46:22.113260-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.113555-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.113590-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.113873-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.114016-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.114109-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.114559-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.114726-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.115068-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.115391-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.115571-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	16:46:22.115798-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	16:46:22.115933-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.116359-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.116513-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.116364-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.116832-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.117094-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.117213-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.117511-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	16:46:22.117672-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.117671-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.117803-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	16:46:22.118056-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	16:46:22.118192-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.118297-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.118408-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.118515-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.118534-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.118613-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.118624-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.118711-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.119110-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.119230-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	16:46:22.119518-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	16:46:22.119535-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.119658-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.119965-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.120268-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.120393-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.120404-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.120743-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.120979-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.121134-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.121426-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.121351-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.121594-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.121705-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.122143-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.122345-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.122554-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.122864-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	16:46:22.122790-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.122997-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	16:46:22.123009-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.123126-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.123428-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	16:46:22.123677-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.123662-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.123848-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	16:46:22.124008-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.124028-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.124205-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	16:46:22.124427-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	16:46:22.124665-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.125264-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.125442-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.125264-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	16:46:22.125765-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.125777-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.126079-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.126211-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.127357-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.127444-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	16:46:22.127540-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.127566-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.127665-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.127769-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.127849-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.127867-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.129734-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.129903-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.132118-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.129573-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	16:46:22.132364-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.132725-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.132837-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	16:46:22.132934-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	16:46:22.133019-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.133673-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.133780-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.134074-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.134195-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.134485-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.135373-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.135574-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.135962-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136069-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136308-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136416-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136426-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.136498-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136574-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136653-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136684-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.136729-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.136898-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.137100-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137201-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137288-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137367-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137447-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137525-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137600-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137676-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137753-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137828-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.137909-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.138257-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.138457-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.138778-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.138870-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.138876-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.138952-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.139003-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.139029-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.139800-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.141964-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.142199-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.143235-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.143330-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.143807-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.143873-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.144229-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.144332-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.144376-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.144421-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.144498-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.144582-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.144633-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.144970-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.145071-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.145456-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.145546-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.145634-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.145876-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.145967-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.146202-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.146285-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.146490-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	16:46:22.146610-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	16:46:22.146840-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	16:46:22.146910-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	16:46:22.146961-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.147007-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.147051-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.147094-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.147824-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.148160-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.148309-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.148634-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.148771-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.152089-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.152323-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.153704-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.154120-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.154458-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.154586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.154681-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.154927-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.155452-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.156250-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.158040-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.158241-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.160211-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.160392-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.161026-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.161201-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.161947-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.162152-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.162523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.163568-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.165011-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.167690-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.167879-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.168618-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.168793-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.168900-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.169226-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.170439-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.170830-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.170968-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.171211-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.171308-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.171525-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.171627-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.173176-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.173341-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.173679-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.173844-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.174149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.174285-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.176176-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.178999-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.179362-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.179505-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.179617-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.183531-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.183716-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.184340-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.186248-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.186619-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.187105-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.187238-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.187576-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.188111-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.188450-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.188822-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.189218-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.189366-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.189623-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.189727-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.189953-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.190061-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.191108-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.191287-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.194529-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.194789-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.195173-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.195988-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.196137-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.196263-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.196840-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.197035-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.197384-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.197509-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.197788-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.197923-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.198208-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.198352-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.198668-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.198792-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.199078-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.201839-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.203218-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.203553-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.204586-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.204843-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.205596-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.210269-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.210417-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.210525-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.211071-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.211239-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.211518-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.211884-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.212024-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.224833-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.225495-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.225997-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.229460-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.229644-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.229899-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.230032-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.230129-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.230345-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.230448-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.232038-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.232800-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.233474-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.233952-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.234133-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.234602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.235141-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.236392-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.236658-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.237212-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.237459-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.237667-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.238112-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.238236-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.240317-0500	runningboardd	Invalidating assertion 166-10341-2554 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:22.240614-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.240793-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.243501-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.243690-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.243814-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.244687-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.244847-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.244972-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.245405-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.245596-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.246206-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.246362-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.246474-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.246865-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.247128-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.247445-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.248008-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.248186-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.248697-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.249989-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.250168-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.250704-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.250868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.251000-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.251595-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.251833-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.252185-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.252319-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.254297-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.254976-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.256215-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.256617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.257848-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.258105-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.258362-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.259133-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.259330-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.259893-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.260234-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.261310-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.261560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.261826-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.262880-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.263112-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.263236-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.263824-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.263994-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.265448-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.265625-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.266153-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.267627-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.267791-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.267966-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.268346-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.268507-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.268784-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.268928-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.269037-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.269294-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.269458-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.269562-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.270986-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.271226-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.271697-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.271847-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.273036-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.273200-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.273514-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.273947-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.274323-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.274456-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.274837-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.275161-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.275718-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.275911-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.277271-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.277677-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.278436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.278739-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.279068-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.279208-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.279448-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.279565-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.279649-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.279876-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.279980-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.280302-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.282339-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.282591-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.283008-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.283253-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.283874-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.284046-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.284379-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.284543-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.284857-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.285046-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.285911-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.286547-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.286853-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.288855-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.289004-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.289439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.290512-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.291213-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.291388-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.291675-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.291819-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.292256-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.292923-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.293101-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.293231-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.294389-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.294603-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.294918-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.295063-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.295175-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.295909-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.296055-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.296169-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.296439-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.296574-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.296837-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.297055-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.297363-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.297492-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.297605-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.297894-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.298048-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.298320-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.298455-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.298561-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.298840-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.298974-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.300052-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.300941-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.301126-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.301418-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.301568-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.301826-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.302310-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.302452-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.302947-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.303711-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.304481-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.305797-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.306245-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.307832-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.308496-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.309084-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.309237-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.309879-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.310645-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.311758-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.312423-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.313700-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.315859-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.316562-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.317049-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.318502-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.319602-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.319998-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.320163-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.320494-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.321866-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.322494-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.323349-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.324271-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.325172-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.325522-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.325660-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.325772-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.326370-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.326536-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.326667-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.326967-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.327111-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.327481-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.327611-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.328057-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.330317-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.330466-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.333344-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.333885-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.334052-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.334383-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.334501-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.334588-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.335149-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.335297-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.335407-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.335743-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.335884-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.336554-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.336870-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.337146-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.339404-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.339608-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.341159-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.341495-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.342514-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.342931-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.343034-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.343096-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.343293-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.343367-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.343426-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.344074-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.344302-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.344573-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.344877-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.345014-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.345251-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.345357-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.345458-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.345701-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.345830-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.346466-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.346941-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.347090-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.347501-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.347645-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.348346-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.348820-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.349405-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.350132-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.350266-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.350343-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.350536-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.351869-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.351975-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.355832-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.356177-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.357316-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.357501-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.357631-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.358338-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.358503-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.358630-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.358952-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.359131-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.359710-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.359855-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.360152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.360960-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.361754-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.361941-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.362560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.362700-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.362977-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.363105-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.363730-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.363917-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.364717-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.364856-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.367360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.367567-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.368100-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.368316-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.368675-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.368808-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.369085-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.369206-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.369482-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.370321-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.370722-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.370857-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.371140-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.371268-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.371531-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.371673-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.372672-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.372843-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.373891-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.374063-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.374358-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.374519-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.385904-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.386063-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.397607-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.397777-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.398478-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.398654-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.399765-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.400048-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.400701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.400868-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.403249-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.403426-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.406884-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.407043-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.407449-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.407598-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.407850-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.407978-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.408227-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.408325-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.408569-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.408677-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.408934-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.409225-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.409651-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.409795-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.410197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.410324-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:22.410343-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.410372-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:22.410415-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:22.410705-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.410866-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.411160-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.411355-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.411833-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.412236-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.412703-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.413002-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.413640-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.413779-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.414694-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.414793-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.414966-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.415052-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.415225-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.415286-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.415420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.415936-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.416284-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.416443-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.416728-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.416836-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.417069-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.417172-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.417404-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.417695-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.418405-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.418544-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.418787-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.418891-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.419122-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.419244-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.419490-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.419667-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.420042-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.420186-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.420450-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.421509-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.422493-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.422662-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.424511-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.424686-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.424983-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.425129-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.425421-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.425544-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.426008-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.426392-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.426789-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.426956-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.427251-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.427364-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.427613-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.427722-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.427962-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.428356-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.428711-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.428864-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.429426-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.429560-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.429824-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.429960-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.430228-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.430335-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.430597-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.431651-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.432113-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.432502-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.433073-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.433250-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.433805-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.433979-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.434636-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.435364-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.435923-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.436101-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.436399-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.436539-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.436768-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.436918-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.437236-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.437925-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.439086-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.439269-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.439250-0500	runningboardd	Invalidating assertion 166-103-2553 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:22.439946-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.440095-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.440314-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.440443-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.440901-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.441040-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.441446-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.441586-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.441824-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.441936-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.442022-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.442233-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.442333-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.442704-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.443664-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.443845-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.445795-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.446022-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.446660-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.447649-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.447781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.447875-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.449837-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.449996-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.450263-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.450412-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.450660-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.451018-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.451164-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.451273-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.451551-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.451697-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.451951-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.452070-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.452502-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.452806-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.452961-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.453336-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.453664-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.453821-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.454075-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.454197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.454294-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.454526-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.455682-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.455929-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.456136-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.456811-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.457123-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.457251-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.457346-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.457576-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.457683-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.457784-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.458451-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.458606-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.458859-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.458973-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.459058-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.459269-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.459367-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.459748-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.460053-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.460185-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.460483-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.461191-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.461508-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.462956-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.463202-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.463985-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.464917-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.465121-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.465464-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.465871-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.466056-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.466428-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.466876-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.467034-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.467633-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.467838-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.468631-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.470417-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.470658-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.471899-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.472151-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.472279-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.472557-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.472701-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.473717-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.474062-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.474193-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.474626-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.474772-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.474889-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.475152-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.475300-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.475544-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.475661-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.476006-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.476696-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.476819-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.476893-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.477076-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.477168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.477327-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.477400-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.477925-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.478277-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.478420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.478533-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.478796-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.478934-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.479180-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.479305-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.479760-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.480295-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.480458-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.480571-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.481096-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.481293-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.482034-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.482187-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.482290-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.482515-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.482618-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.482714-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.482943-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.483248-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.483629-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.483778-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.484957-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.485707-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.485905-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.486061-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.486788-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.486994-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.487339-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.487941-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.488064-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.488410-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.488548-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.488667-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.489228-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.489388-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.489653-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.489995-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.490267-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.490760-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.491055-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.491309-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.491959-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.492144-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.492444-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.492588-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.492695-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.492934-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.493046-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.493267-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.493572-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.493999-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.494298-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.494729-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.494846-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.495110-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.495228-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.495332-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.496242-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.496421-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.496877-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.497042-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.497147-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.497711-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.497880-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.498008-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.498318-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.498473-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.498799-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.498950-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.499978-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.504787-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.505142-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.507332-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.508457-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.508704-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.510011-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.510245-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.510355-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.514807-0500	RedLemon	    📺 Resolution match: 1080p
default	16:46:22.521716-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.523345-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.541141-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.541502-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.542176-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.542483-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.542962-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.543387-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.543734-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.543900-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.544460-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.544862-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.546072-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.546376-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.547425-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.548387-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.549098-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.549252-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.550056-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.550947-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.553003-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.553333-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.555360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.556293-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.557832-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.558063-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.559182-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.560560-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.560930-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.561338-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.561670-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.561805-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.562098-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.562267-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.563689-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.563838-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.564209-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.565149-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.565666-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.565830-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.567765-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.567934-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.569931-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.570192-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.571676-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.571875-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.572171-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	16:46:22.572282-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:22.574080-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	16:46:22.574203-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:22.574378-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	16:46:22.574470-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	16:46:22.574531-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 206
default	16:46:22.574609-0500	RedLemon	   OUTPUT[0]: Frankenstein.2025.2160p.NF.WEB-DL.HDR.MULTi.DDP5.1.Atmos.H265-BEN.THE.MEN
👤 542 💾 36.27 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇷🇺 / 🇮🇹 / 🇵🇹 / 🇪🇸 / 🇫🇷 / 🇩🇪 / 🇮🇳 / 🇵🇱 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	16:46:22.574671-0500	RedLemon	   OUTPUT[1]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	16:46:22.575289-0500	RedLemon	   OUTPUT[2]: Frankenstein.2025.2160p.NF.WEB-DL.DV.P5.ENG.LATINO.DDP5.1.Atmos.MP4.H265-BTM
👤 109 💾 22.86 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio | Subtitles: 3
default	16:46:22.575437-0500	RedLemon	   OUTPUT[3]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	16:46:22.575597-0500	RedLemon	   OUTPUT[4]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	16:46:22.575721-0500	RedLemon	   OUTPUT[5]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	16:46:22.575997-0500	RedLemon	   OUTPUT[6]: Frankenstein (2025) [MULTi] [2160p] [NF] [WEB-DL] [HDR] [H265] [DDP5.1.Atmos-K83] [Lektor PL i Napisy PL]
👤 18 💾 21.81 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 2160p | torrentio | Subtitles: 3
default	16:46:22.576217-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	16:46:22.576344-0500	RedLemon	   OUTPUT[8]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	16:46:22.576455-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	16:46:22.576766-0500	RedLemon	   OUTPUT[10]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	16:46:22.577292-0500	RedLemon	   OUTPUT[11]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	16:46:22.577600-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	16:46:22.577892-0500	RedLemon	   OUTPUT[13]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.DV.H.265-SNAKE
👤 35 💾 3 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.578026-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.578279-0500	RedLemon	   OUTPUT[15]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.HDR.H.265-SNAKE
👤 12 💾 4.19 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.578861-0500	RedLemon	   OUTPUT[16]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	16:46:22.579107-0500	RedLemon	   OUTPUT[17]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.579442-0500	RedLemon	   OUTPUT[18]: Frankenstein.2025.1080p.WEB.h264-ETHEL
👤 175 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.579663-0500	RedLemon	   OUTPUT[19]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	16:46:22.579782-0500	RedLemon	   OUTPUT[20]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	16:46:22.579904-0500	RedLemon	   OUTPUT[21]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.580024-0500	RedLemon	   OUTPUT[22]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.580127-0500	RedLemon	   OUTPUT[23]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.580749-0500	RedLemon	   OUTPUT[24]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
👤 122 💾 5.98 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.581039-0500	RedLemon	   OUTPUT[25]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.581202-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	16:46:22.581418-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.81 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	16:46:22.581645-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	16:46:22.581862-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.581994-0500	RedLemon	   OUTPUT[30]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.582489-0500	RedLemon	   OUTPUT[31]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.582632-0500	RedLemon	   OUTPUT[32]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.582755-0500	RedLemon	   OUTPUT[33]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.582956-0500	RedLemon	   OUTPUT[34]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	16:46:22.583101-0500	RedLemon	   OUTPUT[35]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.583307-0500	RedLemon	   OUTPUT[36]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	16:46:22.583489-0500	RedLemon	   OUTPUT[37]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	16:46:22.583684-0500	RedLemon	   OUTPUT[38]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.583960-0500	RedLemon	   OUTPUT[39]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.584076-0500	RedLemon	   OUTPUT[40]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.584306-0500	RedLemon	   OUTPUT[41]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.584621-0500	RedLemon	   OUTPUT[42]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.584758-0500	RedLemon	   OUTPUT[43]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.584875-0500	RedLemon	   OUTPUT[44]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.584980-0500	RedLemon	   OUTPUT[45]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	16:46:22.585892-0500	RedLemon	   OUTPUT[46]: Frankenstein (2025) [MULTi] [1080p] [NF] [WEB-DL] [H264] [DDP5.1.Atmos-K83[ [Lektor PL i Napisy PL]
👤 9 💾 6.66 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 1080p | torrentio | Subtitles: 3
default	16:46:22.586071-0500	RedLemon	   OUTPUT[47]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	16:46:22.586215-0500	RedLemon	   OUTPUT[48]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.586338-0500	RedLemon	   OUTPUT[49]: Frankenstein.2025.WEB-DL.1080p-Dual-Lat
👤 7 💾 6.8 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	16:46:22.586447-0500	RedLemon	   OUTPUT[50]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	16:46:22.586560-0500	RedLemon	   OUTPUT[51]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.586846-0500	RedLemon	   OUTPUT[52]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.587016-0500	RedLemon	   OUTPUT[53]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.587271-0500	RedLemon	   OUTPUT[54]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.587409-0500	RedLemon	   OUTPUT[55]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	16:46:22.587515-0500	RedLemon	   OUTPUT[56]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.587621-0500	RedLemon	   OUTPUT[57]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	16:46:22.587719-0500	RedLemon	   OUTPUT[58]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.587827-0500	RedLemon	   OUTPUT[59]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	16:46:22.587920-0500	RedLemon	   OUTPUT[60]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	16:46:22.588447-0500	RedLemon	   OUTPUT[61]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	16:46:22.588632-0500	RedLemon	   OUTPUT[62]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.589025-0500	RedLemon	   OUTPUT[63]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	16:46:22.589174-0500	RedLemon	   OUTPUT[64]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.589468-0500	RedLemon	   OUTPUT[65]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	16:46:22.589662-0500	RedLemon	   OUTPUT[66]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	16:46:22.589785-0500	RedLemon	   OUTPUT[67]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	16:46:22.590276-0500	RedLemon	   OUTPUT[68]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	16:46:22.590401-0500	RedLemon	   OUTPUT[69]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	16:46:22.590507-0500	RedLemon	   OUTPUT[70]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	16:46:22.590610-0500	RedLemon	   OUTPUT[71]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.590718-0500	RedLemon	   OUTPUT[72]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.590828-0500	RedLemon	   OUTPUT[73]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.590934-0500	RedLemon	   OUTPUT[74]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.592277-0500	RedLemon	   OUTPUT[75]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	16:46:22.592520-0500	RedLemon	   OUTPUT[76]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	16:46:22.592761-0500	RedLemon	   OUTPUT[77]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	16:46:22.593307-0500	RedLemon	   OUTPUT[78]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	16:46:22.593607-0500	RedLemon	   OUTPUT[79]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.594075-0500	RedLemon	   OUTPUT[80]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.594368-0500	RedLemon	   OUTPUT[81]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.594610-0500	RedLemon	   OUTPUT[82]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.595052-0500	RedLemon	   OUTPUT[83]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.595232-0500	RedLemon	   OUTPUT[84]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.595524-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	16:46:22.595712-0500	RedLemon	   OUTPUT[86]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.596127-0500	RedLemon	   OUTPUT[87]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.596319-0500	RedLemon	   OUTPUT[88]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.596585-0500	RedLemon	   OUTPUT[89]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.596762-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.596939-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.597609-0500	RedLemon	   OUTPUT[92]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	16:46:22.598514-0500	RedLemon	   OUTPUT[93]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.600070-0500	RedLemon	   OUTPUT[94]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	16:46:22.600297-0500	RedLemon	   OUTPUT[95]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.600461-0500	RedLemon	   OUTPUT[96]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.600611-0500	RedLemon	   OUTPUT[97]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	16:46:22.600763-0500	RedLemon	   OUTPUT[98]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	16:46:22.600909-0500	RedLemon	   OUTPUT[99]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	16:46:22.601047-0500	RedLemon	   OUTPUT[100]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.601609-0500	RedLemon	   OUTPUT[101]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.601913-0500	RedLemon	   OUTPUT[102]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	16:46:22.602396-0500	RedLemon	   OUTPUT[103]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	16:46:22.602595-0500	RedLemon	   OUTPUT[104]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.602994-0500	RedLemon	   OUTPUT[105]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	16:46:22.603159-0500	RedLemon	   OUTPUT[106]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.603301-0500	RedLemon	   OUTPUT[107]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	16:46:22.603430-0500	RedLemon	   OUTPUT[108]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	16:46:22.603555-0500	RedLemon	   OUTPUT[109]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.603681-0500	RedLemon	   OUTPUT[110]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.603811-0500	RedLemon	   OUTPUT[111]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	16:46:22.604410-0500	RedLemon	   OUTPUT[112]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	16:46:22.604568-0500	RedLemon	   OUTPUT[113]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.604926-0500	RedLemon	   OUTPUT[114]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.605068-0500	RedLemon	   OUTPUT[115]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.605201-0500	RedLemon	   OUTPUT[116]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	16:46:22.605329-0500	RedLemon	   OUTPUT[117]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.605453-0500	RedLemon	   OUTPUT[118]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.605573-0500	RedLemon	   OUTPUT[119]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.607192-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:22.607234-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:22.607273-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:22.608107-0500	RedLemon	   OUTPUT[120]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.608468-0500	RedLemon	   OUTPUT[121]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.608711-0500	RedLemon	   OUTPUT[122]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.609000-0500	RedLemon	   OUTPUT[123]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	16:46:22.609191-0500	RedLemon	   OUTPUT[124]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.609348-0500	RedLemon	   OUTPUT[125]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	16:46:22.609484-0500	RedLemon	   OUTPUT[126]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.609617-0500	RedLemon	   OUTPUT[127]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.609741-0500	RedLemon	   OUTPUT[128]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.609865-0500	RedLemon	   OUTPUT[129]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	16:46:22.610517-0500	RedLemon	   OUTPUT[130]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	16:46:22.610692-0500	RedLemon	   OUTPUT[131]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	16:46:22.610829-0500	RedLemon	   OUTPUT[132]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	16:46:22.610955-0500	RedLemon	   OUTPUT[133]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.611084-0500	RedLemon	   OUTPUT[134]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.611215-0500	RedLemon	   OUTPUT[135]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.611346-0500	RedLemon	   OUTPUT[136]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.612030-0500	RedLemon	   OUTPUT[137]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.612221-0500	RedLemon	   OUTPUT[138]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	16:46:22.612373-0500	RedLemon	   OUTPUT[139]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.612520-0500	RedLemon	   OUTPUT[140]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.615195-0500	RedLemon	   OUTPUT[141]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	16:46:22.615823-0500	RedLemon	   OUTPUT[142]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	16:46:22.616399-0500	RedLemon	   OUTPUT[143]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.616710-0500	RedLemon	   OUTPUT[144]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.617021-0500	RedLemon	   OUTPUT[145]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	16:46:22.617182-0500	RedLemon	   OUTPUT[146]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	16:46:22.617466-0500	RedLemon	   OUTPUT[147]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	16:46:22.617645-0500	RedLemon	   OUTPUT[148]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	16:46:22.617748-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.617840-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.617928-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.618012-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.618098-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.618812-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.618928-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.619019-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.619101-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.619179-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.619252-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.619327-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.619565-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.620335-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.620466-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.620790-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.620942-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.621193-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.621309-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.621397-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.621478-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.621555-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.621632-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.621707-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.622157-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.622263-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	16:46:22.622354-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.622458-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.622545-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.622863-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.622997-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.623095-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.623182-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.623262-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.623347-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.623429-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.623830-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.623944-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.624174-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.624366-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.624461-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.624691-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.624813-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.625438-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.625566-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.625662-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.625749-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.625833-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.625916-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	16:46:22.626003-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	16:46:22.626655-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	16:46:22.626763-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	16:46:22.626852-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	16:46:22.626934-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.627010-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.627088-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.627163-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	16:46:22.871661-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> received response, status 200 content K
default	16:46:22.872014-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> response ended
default	16:46:22.872219-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> done using Connection 10
default	16:46:22.873069-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> summary for task success {transaction_duration_ms=2921, response_status=200, connection=10, reused=1, request_start_ms=6, request_duration_ms=0, response_start_ms=2920, response_duration_ms=0, request_bytes=277, response_bytes=19768, cache_hit=false}
default	16:46:22.873179-0500	RedLemon	[C3] event: client:data_stall @57.965s
default	16:46:22.873301-0500	RedLemon	Task <D79EF925-4D88-4E56-BAB7-A37CE82D7109>.<11> finished successfully
default	16:46:22.880841-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:22.881484-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C7E2C929-7E83-422C-889E-6E28E6D08BAA] (reporting strategy default)> on Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> was not selected for reporting
default	16:46:22.883266-0500	RedLemon	Connection 25: starting, TC(0x0)
default	16:46:22.883336-0500	RedLemon	[C25 EEDB2563-5D84-4042-A9D5-8E6C59462317 127.0.0.1:47253 tcp, url hash: 0a725c2c, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:22.883424-0500	RedLemon	[C25 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	16:46:22.883665-0500	RedLemon	[C25 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: 9FB679F2-B1CD-409F-8C80-74E7619836A4
default	16:46:22.884427-0500	RedLemon	[C25 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.001s
default	16:46:22.884462-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C25] reporting state preparing
default	16:46:22.884644-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> setting up Connection 25
default	16:46:22.885107-0500	RedLemon	nw_socket_handle_socket_event [C25:2] Socket received CONNECTED event
default	16:46:22.885288-0500	RedLemon	nw_flow_connected [C25 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	16:46:22.885421-0500	RedLemon	[C25 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.002s
default	16:46:22.885482-0500	RedLemon	nw_flow_connected [C25 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:22.885633-0500	RedLemon	[C25 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	16:46:22.885746-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C25] reporting state ready
default	16:46:22.885842-0500	RedLemon	[C25 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.002s
default	16:46:22.885915-0500	RedLemon	Connection 25: connected successfully
default	16:46:22.885997-0500	RedLemon	Connection 25: ready C(N) E(N)
default	16:46:22.886162-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> now using Connection 25
default	16:46:22.886324-0500	RedLemon	Connection 25: received viability advisory(Y)
default	16:46:22.887511-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> sent request, body S 90
default	16:46:22.890024-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	16:46:22.890523-0500	RedLemon	✅ Token found, attempting unlock...
default	16:46:22.891212-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:22.891787-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [82D34233-5EE0-48D7-A764-F66E84CA2334] (reporting strategy default)> on Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> was not selected for reporting
default	16:46:22.892433-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:22.892676-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:46:22.893039-0500	RedLemon	Connection 26: enabling TLS
default	16:46:22.893074-0500	RedLemon	Connection 26: starting, TC(0x0)
default	16:46:22.893124-0500	RedLemon	[C26 0554B3FA-A5C9-4452-8C57-700EB45E67F1 Hostname#706dc610:443 quic-connection, url hash: 718812b8, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:22.893342-0500	RedLemon	[C26 Hostname#706dc610:443 initial path ((null))] event: path:start @0.000s
default	16:46:22.894196-0500	RedLemon	[C26 Hostname#706dc610:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 5054658E-35A8-44D6-8DEE-D843B9E8227E
default	16:46:22.894376-0500	RedLemon	[C26 Hostname#706dc610:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.001s
default	16:46:22.894413-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C26] reporting state preparing
default	16:46:22.894675-0500	RedLemon	[C26.1 Hostname#706dc610:443 initial path ((null))] event: path:start @0.001s
default	16:46:22.895011-0500	RedLemon	[C26.1 Hostname#706dc610:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: DF44CA05-85D4-4DD5-AEBE-3D6F5ABBC502
default	16:46:22.895183-0500	RedLemon	[C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	16:46:22.895339-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> setting up Connection 26
default	16:46:22.895426-0500	mDNSResponder	[R3303] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'UQeHIChhSN1OpIMvufZIzg=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:22.906768-0500	symptomsd	Stall symptom detail: (symName/procName/ePid/ifIndex/interfaceType/stallType/endpoint/isFgOrBg): SYMPTOM_LIBNETCORE_DATA_STALL/RedLemon/10341/5/1/1/<private>/0
default	16:46:22.906876-0500	symptomsd	Stall symptom: RedLemon has stale endpoint for stall type (1) on interface type (1), removing it: <private>
default	16:46:22.906935-0500	symptomsd	Stall symptom: RedLemon has 1 stale endpoints total for stall type (1) on interface type (1), removed them
default	16:46:22.906991-0500	symptomsd	Stall symptom SYMPTOM_LIBNETCORE_DATA_STALL: added unique stall type (1) on interface type (1) for existing process RedLemon
default	16:46:22.917730-0500	RedLemon	nw_endpoint_resolver_update [C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#c6625149.443
default	16:46:22.917845-0500	RedLemon	nw_endpoint_resolver_update [C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#887d4fa0.443
default	16:46:22.917952-0500	RedLemon	nw_endpoint_resolver_update [C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#890668fd:443
default	16:46:22.918056-0500	RedLemon	nw_endpoint_resolver_update [C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#a6d10685:443
default	16:46:22.918234-0500	RedLemon	[C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.025s
default	16:46:22.918466-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 initial path ((null))] event: path:start @0.025s
default	16:46:22.918963-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.025s, uuid: C4FB76F5-0F77-432B-AD76-8751010DC738
default	16:46:22.919147-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.025s
default	16:46:22.919734-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.026s
default	16:46:22.920593-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.027s
default	16:46:22.920789-0500	RedLemon	tcp_output [C26.1.1:3] flags=[SEC] seq=3183737103, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3183737103
default	16:46:22.921394-0500	mDNSResponder	[R3303] getaddrinfo stop -- hostname: <mask.hash: 'UQeHIChhSN1OpIMvufZIzg=='>, client pid: 10341 (RedLemon)
default	16:46:22.921715-0500	RedLemon	nw_endpoint_resolver_update [C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#887d4fa0.443
default	16:46:22.921838-0500	RedLemon	nw_endpoint_resolver_update [C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#890668fd:443
default	16:46:22.921946-0500	RedLemon	nw_endpoint_resolver_update [C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#a6d10685:443
default	16:46:22.922188-0500	RedLemon	[C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.028s
default	16:46:23.002199-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> received response, status 200 content K
default	16:46:23.002604-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> response ended
default	16:46:23.002655-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> done using Connection 12
default	16:46:23.002767-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> summary for task success {transaction_duration_ms=2324, response_status=200, connection=12, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=2324, response_duration_ms=0, request_bytes=277, response_bytes=20492, cache_hit=false}
default	16:46:23.002942-0500	RedLemon	Task <AC036E41-C37A-4FA5-8F93-D237B783FF70>.<12> finished successfully
default	16:46:23.007550-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:23.007936-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [50526ED0-E6C7-4878-9D84-658F8C0F238D] (reporting strategy default)> on Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> was not selected for reporting
default	16:46:23.009970-0500	RedLemon	Connection 27: starting, TC(0x0)
default	16:46:23.010088-0500	RedLemon	[C27 92B345F9-BF3F-4DAE-B8C3-B64E26CC1CFA 127.0.0.1:47253 tcp, url hash: 0a725c2c, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:23.010284-0500	RedLemon	[C27 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	16:46:23.010561-0500	RedLemon	[C27 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: 9FB679F2-B1CD-409F-8C80-74E7619836A4
default	16:46:23.011601-0500	RedLemon	[C27 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.001s
default	16:46:23.011634-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C27] reporting state preparing
default	16:46:23.011933-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> setting up Connection 27
default	16:46:23.012489-0500	RedLemon	nw_socket_handle_socket_event [C27:2] Socket received CONNECTED event
default	16:46:23.012602-0500	RedLemon	nw_flow_connected [C27 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	16:46:23.012648-0500	RedLemon	[C27 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.002s
default	16:46:23.012692-0500	RedLemon	nw_flow_connected [C27 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:23.012823-0500	RedLemon	[C27 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	16:46:23.014993-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C27] reporting state ready
default	16:46:23.015248-0500	RedLemon	[C27 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.005s
default	16:46:23.015333-0500	RedLemon	Connection 27: connected successfully
default	16:46:23.015444-0500	RedLemon	Connection 27: ready C(N) E(N)
default	16:46:23.016056-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> now using Connection 27
default	16:46:23.016343-0500	RedLemon	Connection 27: received viability advisory(Y)
default	16:46:23.018856-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> sent request, body S 90
default	16:46:23.020610-0500	RedLemon	🔓 Unlock request: infoHash=50a4c9c42abe..., fileIdx=0
default	16:46:23.020761-0500	RedLemon	✅ Token found, attempting unlock...
default	16:46:23.021226-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:23.021539-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4FEA695B-C7B9-488E-8FCA-6D6EBAB20533] (reporting strategy default)> on Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> was not selected for reporting
default	16:46:23.022121-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:23.022213-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> waiting for setup of Connection 26
default	16:46:23.031388-0500	RedLemon	tcp_input [C26.1.1:3] flags=[S.E] seq=1822946912, ack=3183737104, win=64800 state=SYN_SENT rcv_nxt=0, snd_una=3183737103
default	16:46:23.031550-0500	RedLemon	nw_flow_connected [C26.1.1 IPv6#c6625149.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:23.031770-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.138s
default	16:46:23.031905-0500	RedLemon	[C26.1 Hostname#706dc610:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.138s
default	16:46:23.031961-0500	RedLemon	[C26 Hostname#706dc610:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.138s
default	16:46:23.032555-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C26.1.1:2][0x7f7b9cc80d70] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:23.032680-0500	RedLemon	boringssl_context_info_handler(2028) [C26.1.1:2][0x7f7b9cc80d70] Client handshake started
default	16:46:23.033094-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS client enter_early_data
default	16:46:23.033346-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS client read_server_hello
default	16:46:23.147737-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:23.147995-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:23.148610-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:23.149218-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:23.149925-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:23.150079-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:23.151065-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C26.1.1:2][0x7f7b9cc80d70] Performing external trust evaluation
default	16:46:23.151215-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C26.1.1:2][0x7f7b9cc80d70] Asyncing for external verify block
default	16:46:23.151387-0500	RedLemon	Connection 26: asked to evaluate TLS Trust
default	16:46:23.151671-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> auth completion disp=1 cred=0x0
default	16:46:23.155425-0500	RedLemon	Connection 26: TLS Trust result 0
default	16:46:23.155472-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C26.1.1:2][0x7f7b9cc80d70] Returning from external verify block with result: true
default	16:46:23.155522-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C26.1.1:2][0x7f7b9cc80d70] Certificate verification result: OK
default	16:46:23.155847-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:23.156145-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:23.156184-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:23.156220-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:23.156255-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:23.156389-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS 1.3 client done
default	16:46:23.156563-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS client finish_client_handshake
default	16:46:23.156608-0500	RedLemon	boringssl_context_info_handler(2045) [C26.1.1:2][0x7f7b9cc80d70] Client handshake state: TLS client done
default	16:46:23.156645-0500	RedLemon	boringssl_context_info_handler(2034) [C26.1.1:2][0x7f7b9cc80d70] Client handshake done
default	16:46:23.157351-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C26.1.1:2][0x7f7b9cc80d70] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0804) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(125ms) flight_time(116ms) rtt(114ms) write_stalls(0) read_stalls(6)]
default	16:46:23.157601-0500	RedLemon	nw_flow_connected [C26.1.1 IPv6#c6625149.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:23.158035-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.264s
default	16:46:23.158162-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C26] reporting state ready
default	16:46:23.158288-0500	RedLemon	[C26.1 Hostname#706dc610:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.265s
default	16:46:23.158343-0500	RedLemon	[C26 Hostname#706dc610:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.265s
default	16:46:23.158531-0500	RedLemon	[C26.1.1 IPv6#c6625149.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.265s
default	16:46:23.158658-0500	RedLemon	[C26.1 Hostname#706dc610:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.265s
default	16:46:23.158708-0500	RedLemon	[C26 Hostname#706dc610:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.265s
default	16:46:23.158827-0500	RedLemon	Connection 26: connected successfully
default	16:46:23.158888-0500	RedLemon	Connection 26: TLS handshake complete
default	16:46:23.159104-0500	RedLemon	Connection 26: ready C(N) E(N)
default	16:46:23.159512-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> now using Connection 26
default	16:46:23.159810-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> now using Connection 26
default	16:46:23.159990-0500	RedLemon	Connection 26: received viability advisory(Y)
default	16:46:23.160273-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> sent request, body S 291
default	16:46:23.160965-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> sent request, body S 291
default	16:46:23.600482-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> received response, status 201 content U
default	16:46:23.600675-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> received response, status 201 content U
default	16:46:23.600775-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> done using Connection 26
default	16:46:23.600877-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> done using Connection 26
default	16:46:23.601042-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> response ended
default	16:46:23.601130-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> response ended
default	16:46:23.601222-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> summary for task success {transaction_duration_ms=579, response_status=201, connection=26, reused=1, request_start_ms=138, request_duration_ms=0, response_start_ms=578, response_duration_ms=0, request_bytes=396, response_bytes=196, cache_hit=false}
default	16:46:23.601366-0500	RedLemon	Task <480063CD-D058-421D-92CB-C7DA328CB27A>.<112> finished successfully
default	16:46:23.601471-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> summary for task success {transaction_duration_ms=709, response_status=201, connection=26, protocol="h2", domain_lookup_duration_ms=24, connect_duration_ms=237, secure_connection_duration_ms=125, private_relay=false, request_start_ms=267, request_duration_ms=0, response_start_ms=708, response_duration_ms=0, request_bytes=508, response_bytes=196, cache_hit=false}
default	16:46:23.601655-0500	RedLemon	Task <2C4A8918-3A4B-4F28-9EE6-20C21FF1FF08>.<110> finished successfully
default	16:46:23.601831-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:23.602261-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [74BC7A1D-13DF-4465-97B2-B7C78A575A74] (reporting strategy default)> on Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> was not selected for reporting
default	16:46:23.602669-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:23.603059-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:23.603111-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [390C25CE-5CD3-4A68-8E3A-B79612D27712] (reporting strategy default)> on Task <4158343A-3722-4052-B00E-714841134B40>.<114> was not selected for reporting
default	16:46:23.603292-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> now using Connection 26
default	16:46:23.603647-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> sent request, body N 0
default	16:46:23.603956-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:23.604119-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> now using Connection 26
default	16:46:23.604247-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> sent request, body N 0
default	16:46:23.821834-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> received response, status 200 content U
default	16:46:23.822040-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> done using Connection 26
default	16:46:23.822310-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> response ended
default	16:46:23.822570-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> summary for task success {transaction_duration_ms=219, response_status=200, connection=26, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=219, response_duration_ms=0, request_bytes=98, response_bytes=534, cache_hit=false}
default	16:46:23.822942-0500	RedLemon	Task <9163CB8B-EBE8-4B5F-B4A1-C845AE3D8FEA>.<113> finished successfully
default	16:46:23.824126-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2555 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:23.824513-0500	runningboardd	Assertion 166-10341-2555 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:23.825453-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:23.825866-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C7C28F0B-639D-43ED-BEB2-74936A16C83F] (reporting strategy default)> on Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> was not selected for reporting
default	16:46:23.826594-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:23.826838-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> now using Connection 26
default	16:46:23.827351-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> sent request, body S 7
default	16:46:23.827465-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:23.827591-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:23.827644-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:23.829346-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2556 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:23.829617-0500	runningboardd	Assertion 166-103-2556 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:23.830477-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:23.830526-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:23.830571-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:23.961261-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> received response, status 200 content U
default	16:46:23.961472-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> done using Connection 26
default	16:46:23.961765-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> response ended
default	16:46:23.962019-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> summary for task success {transaction_duration_ms=358, response_status=200, connection=26, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=357, response_duration_ms=0, request_bytes=98, response_bytes=459, cache_hit=false}
default	16:46:23.962297-0500	RedLemon	Task <4158343A-3722-4052-B00E-714841134B40>.<114> finished successfully
default	16:46:23.963076-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:23.963746-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2B19A362-DF67-4FED-9DBE-61E953DFCB9C] (reporting strategy default)> on Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> was not selected for reporting
default	16:46:23.964972-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:23.965198-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> now using Connection 26
default	16:46:23.965672-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> sent request, body S 7
default	16:46:24.136894-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:24.137379-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CFDA2132-F7CB-446B-9EB8-ABD82320AEFA] (reporting strategy default)> on Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> was not selected for reporting
default	16:46:24.138444-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.138853-0500	RedLemon	Connection 28: enabling TLS
default	16:46:24.138876-0500	RedLemon	Connection 28: starting, TC(0x0)
default	16:46:24.138911-0500	RedLemon	[C28 5ED35FFF-067A-449A-A04C-6CBD396D9D5A Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{9EADB46D-1A17-4382-99A8-94C7687E22FC}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:24.138964-0500	RedLemon	[C28 Hostname#6d693a93:443 initial path ((null))] event: path:start @0.000s
default	16:46:24.139197-0500	RedLemon	[C28 Hostname#6d693a93:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 40BD09F2-05E2-45E0-8068-F603DFBF9E31
default	16:46:24.139514-0500	mDNSResponder	[R3304] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:24.139321-0500	RedLemon	[C28 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:24.139345-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state preparing
default	16:46:24.139523-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> setting up Connection 28
default	16:46:24.140883-0500	mDNSResponder	[R3304] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 10341 (RedLemon)
default	16:46:24.141333-0500	RedLemon	nw_endpoint_resolver_update [C28 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7a3df01a:443
default	16:46:24.141462-0500	RedLemon	[C28 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	16:46:24.141670-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 initial path ((null))] event: path:start @0.002s
default	16:46:24.142035-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: 3252298C-6B83-4F83-90FC-9725411765B1
default	16:46:24.142180-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	16:46:24.142730-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.003s
default	16:46:24.143527-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.004s
default	16:46:24.143682-0500	RedLemon	tcp_output [C28.1:3] flags=[S] seq=2197232713, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2197232713
default	16:46:24.398663-0500	RedLemon	tcp_output [C28.1:3] flags=[S] seq=2197232713, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2197232713
default	16:46:24.401153-0500	RedLemon	tcp_input [C28.1:3] flags=[S.] seq=366425210, ack=2197232714, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2197232713
default	16:46:24.401276-0500	RedLemon	nw_flow_connected [C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:24.401400-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.262s
default	16:46:24.401456-0500	RedLemon	[C28 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.262s
default	16:46:24.401731-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C28.1:2][0x7f7b9d524380] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:24.401817-0500	RedLemon	boringssl_context_info_handler(2028) [C28.1:2][0x7f7b9d524380] Client handshake started
default	16:46:24.401921-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS client enter_early_data
default	16:46:24.402009-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS client read_server_hello
default	16:46:24.403122-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> received response, status 204 content U
default	16:46:24.403250-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> done using Connection 26
default	16:46:24.403399-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> response ended
default	16:46:24.403539-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> summary for task success {transaction_duration_ms=577, response_status=204, connection=26, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=576, response_duration_ms=0, request_bytes=124, response_bytes=48, cache_hit=false}
default	16:46:24.403755-0500	RedLemon	Task <BD2BCC4D-87C0-4C44-9446-8A5711909F27>.<115> finished successfully
default	16:46:24.403991-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:24.404275-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [141640F1-926C-496A-B87E-83E68A07FB0D] (reporting strategy default)> on Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> was not selected for reporting
default	16:46:24.405035-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.405210-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> now using Connection 26
default	16:46:24.405389-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> sent request, body N 0
default	16:46:24.414628-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> received response, status 204 content U
default	16:46:24.414818-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> done using Connection 26
default	16:46:24.414987-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> response ended
default	16:46:24.415208-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> summary for task success {transaction_duration_ms=450, response_status=204, connection=26, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=450, response_duration_ms=0, request_bytes=123, response_bytes=48, cache_hit=false}
default	16:46:24.415569-0500	RedLemon	Task <37703C38-C248-48E6-A34E-5707D86CEF6D>.<116> finished successfully
default	16:46:24.415929-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:24.416555-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2A0308ED-0B63-4D9E-9E12-EFB09F5096A4] (reporting strategy default)> on Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> was not selected for reporting
default	16:46:24.417356-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.417501-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> now using Connection 26
default	16:46:24.417624-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> sent request, body N 0
default	16:46:24.516865-0500	RedLemon	tcp_input [C28.1:3] flags=[S.] seq=366425210, ack=2197232714, win=31856 state=ESTABLISHED rcv_nxt=366425211, snd_una=2197232714
default	16:46:24.525615-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:24.526089-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:24.527070-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:24.527518-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:24.528186-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:24.528255-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:24.530154-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C28.1:2][0x7f7b9d524380] Performing external trust evaluation
default	16:46:24.530369-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C28.1:2][0x7f7b9d524380] Asyncing for external verify block
default	16:46:24.530797-0500	RedLemon	Connection 28: asked to evaluate TLS Trust
default	16:46:24.531076-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> auth completion disp=1 cred=0x0
default	16:46:24.538229-0500	RedLemon	Connection 28: TLS Trust result 0
default	16:46:24.538285-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C28.1:2][0x7f7b9d524380] Returning from external verify block with result: true
default	16:46:24.538366-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C28.1:2][0x7f7b9d524380] Certificate verification result: OK
default	16:46:24.538764-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:24.539011-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:24.539047-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:24.539077-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:24.539109-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:24.539222-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS 1.3 client done
default	16:46:24.539434-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS client finish_client_handshake
default	16:46:24.539475-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f7b9d524380] Client handshake state: TLS client done
default	16:46:24.539509-0500	RedLemon	boringssl_context_info_handler(2034) [C28.1:2][0x7f7b9d524380] Client handshake done
default	16:46:24.540318-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C28.1:2][0x7f7b9d524380] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(139ms) flight_time(126ms) rtt(124ms) write_stalls(0) read_stalls(6)]
default	16:46:24.540474-0500	RedLemon	nw_flow_connected [C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:24.541001-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.402s
default	16:46:24.544533-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state ready
default	16:46:24.544600-0500	RedLemon	[C28 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.405s
default	16:46:24.544819-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.405s
default	16:46:24.544918-0500	RedLemon	[C28 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.405s
default	16:46:24.545367-0500	RedLemon	Connection 28: connected successfully
default	16:46:24.545420-0500	RedLemon	Connection 28: TLS handshake complete
default	16:46:24.545665-0500	RedLemon	Connection 28: ready C(N) E(N)
default	16:46:24.545866-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> now using Connection 28
default	16:46:24.545959-0500	RedLemon	Connection 28: received viability advisory(Y)
default	16:46:24.546181-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> sent request, body N 0
default	16:46:24.566903-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> received response, status 200 content U
default	16:46:24.567198-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> done using Connection 26
default	16:46:24.567372-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> response ended
default	16:46:24.567621-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> summary for task success {transaction_duration_ms=163, response_status=200, connection=26, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=162, response_duration_ms=0, request_bytes=98, response_bytes=579, cache_hit=true}
default	16:46:24.568030-0500	RedLemon	Task <573020D4-3A7E-4E24-81A9-5E4D03FEED00>.<117> finished successfully
default	16:46:24.568941-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:24.569417-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A64F7F15-675F-4930-AD2E-749C9FACC8AF] (reporting strategy default)> on Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> was not selected for reporting
default	16:46:24.576005-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.576392-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> now using Connection 26
default	16:46:24.576896-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> sent request, body S 47
default	16:46:24.668648-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> received response, status 101 content U
default	16:46:24.669059-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> response ended
default	16:46:24.669181-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> done using Connection 28
default	16:46:24.669944-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.530s
default	16:46:24.669986-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state preparing
default	16:46:24.670047-0500	RedLemon	[C28 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.531s
default	16:46:24.670173-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.531s
default	16:46:24.670224-0500	RedLemon	[C28 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.531s
default	16:46:24.670309-0500	RedLemon	nw_flow_connected [C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:24.670427-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.531s
default	16:46:24.670480-0500	RedLemon	[C28 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.531s
default	16:46:24.670587-0500	RedLemon	nw_flow_connected [C28.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:24.670850-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.531s
default	16:46:24.670890-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state ready
default	16:46:24.670945-0500	RedLemon	[C28 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.531s
default	16:46:24.721844-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> received response, status 200 content U
default	16:46:24.722141-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> done using Connection 26
default	16:46:24.722412-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> response ended
default	16:46:24.722691-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> summary for task success {transaction_duration_ms=305, response_status=200, connection=26, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=304, response_duration_ms=0, request_bytes=98, response_bytes=499, cache_hit=true}
default	16:46:24.723177-0500	RedLemon	Task <41162536-C365-47E5-ADF4-469B9AA46D58>.<118> finished successfully
default	16:46:24.724103-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:46:24.724796-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [84FCDA1D-3A28-44BA-827E-01AB82E768A7] (reporting strategy default)> on Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> was not selected for reporting
default	16:46:24.725703-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.725867-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> now using Connection 26
default	16:46:24.726279-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> sent request, body S 47
default	16:46:24.792778-0500	RedLemon	nw_flow_disconnected [C28.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	16:46:24.793174-0500	RedLemon	nw_protocol_tcp_log_summary [C28.1:3] 
	[CEFCBDC2-8D09-4004-99D7-91F147A93DDC <private>:57955<-><private>:443]
	Init: 1, Conn_Time: 257.588ms, SYNs: 2, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 148.468ms, rtt_var: 38.750ms rtt_nc: 213.656ms, rtt_var_nc: 121.187ms base rtt: 121ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:24.793498-0500	RedLemon	tcp_input [C28.1:3] flags=[F.] seq=366428242, ack=2197233767, win=249 state=ESTABLISHED rcv_nxt=366428242, snd_una=2197233767
default	16:46:24.794260-0500	RedLemon	[C28.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.655s, error Socket is not connected
default	16:46:24.794313-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state failed error Socket is not connected
default	16:46:24.794375-0500	RedLemon	[C28 Hostname#6d693a93:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.655s
error	16:46:24.794485-0500	RedLemon	nw_read_request_report [C28] Receive failed with error "Socket is not connected"
error	16:46:24.794553-0500	RedLemon	nw_flow_service_reads [C28.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	16:46:24.794624-0500	RedLemon	tcp_output [C28.1:3] flags=[R.] seq=2197233898, ack=366428243, win=2047 state=CLOSED rcv_nxt=366428243, snd_una=2197233767
error	16:46:24.794790-0500	RedLemon	Connection 28: received failure notification
default	16:46:24.795077-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> summary for task success {transaction_duration_ms=656, response_status=101, connection=28, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=398, secure_connection_duration_ms=139, private_relay=false, request_start_ms=407, request_duration_ms=0, response_start_ms=530, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	16:46:24.795186-0500	RedLemon	Task <3C16AFD2-F4B8-457D-B0FE-C5203672C7FB>.<1> finished successfully
error	16:46:24.795382-0500	RedLemon	nw_flow_add_write_request [C28.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	16:46:24.795464-0500	RedLemon	nw_write_request_report [C28] Send failed with error "Socket is not connected"
default	16:46:24.795614-0500	RedLemon	Connection 28: cleaning up
default	16:46:24.795829-0500	RedLemon	[C28 5ED35FFF-067A-449A-A04C-6CBD396D9D5A Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancel
default	16:46:24.796014-0500	RedLemon	[C28 5ED35FFF-067A-449A-A04C-6CBD396D9D5A Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancelled
	[C28.1 3252298C-6B83-4F83-90FC-9725411765B1 10.0.0.113:57955<->IPv4#7a3df01a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.656s, DNS @0.000s took 0.002s, TCP @0.531s took 0.258s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:24.796372-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state cancelled error Socket is not connected
default	16:46:24.796478-0500	RedLemon	Connection 28: done
default	16:46:24.838320-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> received response, status 200 content U
default	16:46:24.838489-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> done using Connection 26
default	16:46:24.838785-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> response ended
default	16:46:24.839095-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> summary for task success {transaction_duration_ms=269, response_status=200, connection=26, reused=1, request_start_ms=6, request_duration_ms=0, response_start_ms=268, response_duration_ms=0, request_bytes=150, response_bytes=538, cache_hit=true}
default	16:46:24.839726-0500	runningboardd	Invalidating assertion 166-10341-2555 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:24.839431-0500	RedLemon	Task <ED152110-D74B-4C9B-A391-0000A45CDAAB>.<119> finished successfully
default	16:46:24.841124-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2557 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:24.841281-0500	RedLemon	✅ Unlocked successfully: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX.mkv
default	16:46:24.841782-0500	runningboardd	Assertion 166-10341-2557 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:24.842478-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> received response, status 200 content K
default	16:46:24.842700-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> response ended
default	16:46:24.842772-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> done using Connection 27
default	16:46:24.842943-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> summary for task success {transaction_duration_ms=1834, response_status=200, connection=27, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=1, secure_connection_duration_ms=0, private_relay=false, request_start_ms=9, request_duration_ms=0, response_start_ms=1833, response_duration_ms=0, request_bytes=372, response_bytes=375, cache_hit=true}
default	16:46:24.843158-0500	RedLemon	Task <C8142E7F-1A3B-439B-BB8D-23DE1209770C>.<111> finished successfully
default	16:46:24.843641-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	16:46:24.844002-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:24.844002-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:24.844387-0500	runningboardd	Attempting to rename power assertion 34228 for target anon<RedLemon>(501) to anon<RedLemon>(501);166-10341-2555:com.apple.CFNetwork.StorageDB;166-10341-2557:com.apple.CFNetwork.StorageDB
default	16:46:24.844058-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:24.845009-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:24.845199-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:24.845313-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:24.845516-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E95996A5-EB60-404C-9B8A-D32BF11DC5BD] (reporting strategy default)> on Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> was not selected for reporting
default	16:46:24.845128-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5371CABD-BF38-4676-8FE6-1D0881580256] (reporting strategy default)> on Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> was not selected for reporting
default	16:46:24.846239-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [96408AE8-1B25-441C-9606-2A5B8A347869] (reporting strategy default)> on Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> was not selected for reporting
default	16:46:24.852062-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.852272-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.852448-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:46:24.852931-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> waiting for setup of Connection 29
default	16:46:24.852972-0500	RedLemon	Connection 29: enabling TLS
default	16:46:24.853120-0500	RedLemon	Connection 29: starting, TC(0x0)
default	16:46:24.853173-0500	RedLemon	[C29 727A4692-8753-4F29-87A3-0F593E5D822F Hostname#b8adc246:443 quic-connection, url hash: b4755d10, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:24.853252-0500	RedLemon	[C29 Hostname#b8adc246:443 initial path ((null))] event: path:start @0.000s
default	16:46:24.853643-0500	RedLemon	[C29 Hostname#b8adc246:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 4CD12CA7-D61F-498D-BD7C-7CED6BE74F14
default	16:46:24.853796-0500	RedLemon	[C29 Hostname#b8adc246:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	16:46:24.853835-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C29] reporting state preparing
default	16:46:24.854218-0500	RedLemon	[C29.1 Hostname#b8adc246:443 initial path ((null))] event: path:start @0.001s
default	16:46:24.854878-0500	RedLemon	[C29.1 Hostname#b8adc246:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 5506C541-E25D-490B-AAD2-81080A4C2A97
default	16:46:24.855102-0500	RedLemon	[C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	16:46:24.855947-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> setting up Connection 29
default	16:46:24.856323-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.856220-0500	mDNSResponder	[R3305] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 's5BtSxxzPzcRAeeuu9KOpA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:24.856446-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> waiting for setup of Connection 29
default	16:46:24.864896-0500	RedLemon	nw_endpoint_resolver_update [C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#b2b8b9f7.443
default	16:46:24.865011-0500	RedLemon	nw_endpoint_resolver_update [C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60e0df7b:443
default	16:46:24.865392-0500	RedLemon	[C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.012s
default	16:46:24.865761-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 initial path ((null))] event: path:start @0.012s
default	16:46:24.866427-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.013s, uuid: 9D87C5F4-6EE1-42EC-96BC-F708B7B1576D
default	16:46:24.866636-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.013s
default	16:46:24.867496-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.014s
default	16:46:24.869034-0500	RedLemon	nw_protocol_instance_ignore_future_path_changes [C29.1.1:2] Ignoring future path changes for protocol
default	16:46:24.869121-0500	RedLemon	quic_initialize_block_invoke [C29.1.1:2] [-f85162c0cd1387ab] created QUIC connection (spin bit enabled)
default	16:46:24.869982-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.016s
default	16:46:24.872454-0500	RedLemon	quic_crypto_new_flow [C29.1.1:2] [-f85162c0cd1387ab] TLS stream is: [C30]
default	16:46:24.872524-0500	RedLemon	[C30 65DEBD90-AD0E-4566-A530-94C30F0A1F0A IPv6#b2b8b9f7.443 quic-connection, url hash: b4755d10, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{ABD2C178-97BD-4DC4-9B2A-16F820DC36FF}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94, no transport] start
default	16:46:24.872802-0500	RedLemon	[C30 IPv6#b2b8b9f7.443 initial socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:start @0.000s
default	16:46:24.873070-0500	RedLemon	[C30 IPv6#b2b8b9f7.443 waiting socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 9D87C5F4-6EE1-42EC-96BC-F708B7B1576D
default	16:46:24.874093-0500	RedLemon	[C30 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.001s
default	16:46:24.874404-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C30] reporting state preparing
default	16:46:24.874862-0500	RedLemon	nw_flow_connected [C30 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	16:46:24.875030-0500	RedLemon	[C30 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.002s
default	16:46:24.875736-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C30:1][0x7f7b9cbd7e90] TLS configured [min_version(0x0304) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:24.875896-0500	RedLemon	boringssl_context_info_handler(2028) [C30:1][0x7f7b9cbd7e90] Client handshake started
default	16:46:24.876205-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS client enter_early_data
default	16:46:24.876389-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS client read_server_hello
default	16:46:24.885946-0500	RedLemon	nw_endpoint_resolver_update [C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60e0df7b:443
default	16:46:24.886120-0500	RedLemon	[C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.032s
default	16:46:24.887018-0500	RedLemon	nw_endpoint_resolver_update [C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60e0df7b:443
default	16:46:24.887377-0500	RedLemon	[C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.034s
default	16:46:24.888010-0500	mDNSResponder	[R3305] getaddrinfo stop -- hostname: <mask.hash: 's5BtSxxzPzcRAeeuu9KOpA=='>, client pid: 10341 (RedLemon)
default	16:46:24.888462-0500	RedLemon	nw_endpoint_resolver_update [C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60e0df7b:443
default	16:46:24.888750-0500	RedLemon	[C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.035s
default	16:46:24.892395-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:24.892474-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:24.892963-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client read_encrypted_extensions
error	16:46:24.893119-0500	RedLemon	quic_packet_parser_inner [C29.1.1:2] [-0143203e6f6446535b40323efa648ee0bf3caa9d] SH fixed bit is zero
default	16:46:24.893388-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:24.894397-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:24.894467-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:24.894860-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C30:1][0x7f7b9cbd7e90] Performing external trust evaluation
default	16:46:24.895052-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C30:1][0x7f7b9cbd7e90] Asyncing for external verify block
default	16:46:24.895447-0500	RedLemon	Connection 29: asked to evaluate TLS Trust
default	16:46:24.895816-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> auth completion disp=1 cred=0x0
default	16:46:24.906270-0500	RedLemon	Connection 29: TLS Trust result 0
default	16:46:24.906325-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C30:1][0x7f7b9cbd7e90] Returning from external verify block with result: true
default	16:46:24.906400-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C30:1][0x7f7b9cbd7e90] Certificate verification result: OK
default	16:46:24.906912-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:24.907110-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:24.907150-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:24.907193-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:24.907239-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:24.908041-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS 1.3 client done
default	16:46:24.908451-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS client finish_client_handshake
default	16:46:24.908516-0500	RedLemon	boringssl_context_info_handler(2045) [C30:1][0x7f7b9cbd7e90] Client handshake state: TLS client done
default	16:46:24.908555-0500	RedLemon	boringssl_context_info_handler(2034) [C30:1][0x7f7b9cbd7e90] Client handshake done
default	16:46:24.909435-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C30:1][0x7f7b9cbd7e90] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(34ms) flight_time(17ms) rtt(16ms) write_stalls(0) read_stalls(4)]
default	16:46:24.909584-0500	RedLemon	nw_flow_connected [C30 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	16:46:24.909771-0500	RedLemon	[C30 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.037s
default	16:46:24.909996-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C30] reporting state ready
default	16:46:24.910051-0500	RedLemon	[C30 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.037s
default	16:46:24.911998-0500	RedLemon	quic_pmtud_restart [C29.1.1:2] [-0143203e6f6446535b40323efa648ee0bf3caa9d] PMTUD enabled, max PMTU: 1398, header size: 48, current PMTU 1248
default	16:46:24.912077-0500	RedLemon	quic_crypto_tls_ready_inner [C29.1.1:2] [-0143203e6f6446535b40323efa648ee0bf3caa9d] QUIC connection established in 41.662 ms, RTT 15.653 ms
default	16:46:24.912146-0500	RedLemon	nw_flow_connected [C29.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	16:46:24.912331-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.059s
default	16:46:24.912451-0500	RedLemon	[C29.1 Hostname#b8adc246:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.059s
default	16:46:24.912499-0500	RedLemon	[C29 Hostname#b8adc246:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.059s
default	16:46:24.912664-0500	RedLemon	nw_flow_connected [C29.1.1 IPv6#b2b8b9f7.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:24.912962-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.059s
default	16:46:24.913213-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C29] reporting state ready
default	16:46:24.913325-0500	RedLemon	[C29.1 Hostname#b8adc246:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.060s
default	16:46:24.913372-0500	RedLemon	[C29 Hostname#b8adc246:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.060s
default	16:46:24.913533-0500	RedLemon	[C29.1.1 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.060s
default	16:46:24.913645-0500	RedLemon	[C29.1 Hostname#b8adc246:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.060s
default	16:46:24.913692-0500	RedLemon	[C29 Hostname#b8adc246:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.060s
default	16:46:24.913878-0500	RedLemon	Connection 29: connected successfully
default	16:46:24.913922-0500	RedLemon	Connection 29: TLS handshake complete
default	16:46:24.914145-0500	RedLemon	Connection 29: ready C(N) E(N)
default	16:46:24.915378-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> now using Connection 29
default	16:46:24.916140-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> now using Connection 29
default	16:46:24.916937-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> now using Connection 29
default	16:46:24.917705-0500	RedLemon	Connection 29: received viability advisory(Y)
default	16:46:24.917756-0500	RedLemon	0x7f7b9d6abcd8 ID=0 Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> sent request, body N 0
default	16:46:24.917795-0500	RedLemon	0x7f7b9cbf7fd8 ID=4 Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> sent request, body N 0
default	16:46:24.917834-0500	RedLemon	0x7f7b9cbd9138 ID=8 Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> sent request, body N 0
default	16:46:24.920015-0500	RedLemon	boringssl_context_new_session_handler(1336) [C30:1][0x7f7b9cbd7e90] Asyncing for session update block
default	16:46:24.920299-0500	RedLemon	boringssl_context_new_session_handler(1336) [C30:1][0x7f7b9cbd7e90] Asyncing for session update block
default	16:46:24.920430-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C30:1][0x7f7b9cbd7e90] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(34ms) flight_time(17ms) rtt(16ms) write_stalls(0) read_stalls(4)]
default	16:46:24.920533-0500	RedLemon	nw_flow_connected [C30 IPv6#b2b8b9f7.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	16:46:24.921088-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C30:1][0x7f7b9cbd7e90] Returning from session update block
default	16:46:24.921691-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C30:1][0x7f7b9cbd7e90] Returning from session update block
default	16:46:24.921797-0500	RedLemon	quic_stream_create_inbound [C29.1.1:2] [-0143203e6f6446535b40323efa648ee0bf3caa9d] creating inbound stream 3
default	16:46:24.922405-0500	RedLemon	quic_stream_create_inbound [C29.1.1:2] [-0143203e6f6446535b40323efa648ee0bf3caa9d] creating inbound stream 7
default	16:46:24.922796-0500	RedLemon	quic_stream_create_inbound [C29.1.1:2] [-0143203e6f6446535b40323efa648ee0bf3caa9d] creating inbound stream 11
default	16:46:24.925713-0500	RedLemon	quic_stream_create_inbound [C29.1.1:2] [-0143203e6f6446535b40323efa648ee0bf3caa9d] creating inbound stream 15
default	16:46:24.975173-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> received response, status 200 content U
default	16:46:24.975469-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> done using Connection 26
default	16:46:24.975783-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> response ended
default	16:46:24.976330-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> summary for task success {transaction_duration_ms=251, response_status=200, connection=26, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=249, response_duration_ms=0, request_bytes=150, response_bytes=506, cache_hit=true}
default	16:46:24.976960-0500	RedLemon	Task <00322EE8-15B8-403A-A0FF-E0D07D7514AE>.<120> finished successfully
default	16:46:24.978193-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	16:46:24.979762-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> received response, status 200 content K
default	16:46:24.979986-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> response ended
default	16:46:24.980055-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> done using Connection 25
default	16:46:24.980225-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> summary for task success {transaction_duration_ms=2098, response_status=200, connection=25, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=1, secure_connection_duration_ms=0, private_relay=false, request_start_ms=4, request_duration_ms=1, response_start_ms=2097, response_duration_ms=0, request_bytes=372, response_bytes=357, cache_hit=true}
default	16:46:24.980444-0500	RedLemon	Task <AC38B3A0-D117-42DB-B388-F7D98D05BAD9>.<109> finished successfully
default	16:46:24.980655-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	16:46:24.980875-0500	RedLemon	Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:24.981184-0500	RedLemon	Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:24.982032-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E3FCCC6C-2D7A-43B6-AAEE-A94B61796A06] (reporting strategy default)> on Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> was not selected for reporting
default	16:46:24.981924-0500	RedLemon	Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:24.982578-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [51383037-667C-4B8F-9D66-C9B7E1A8213E] (reporting strategy default)> on Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> was not selected for reporting
default	16:46:24.983200-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F438FDC7-E6FD-46E9-BCE6-F460002E1493] (reporting strategy default)> on Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> was not selected for reporting
default	16:46:24.984658-0500	RedLemon	Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.984838-0500	RedLemon	Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> now using Connection 29
default	16:46:24.986953-0500	RedLemon	Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.987138-0500	RedLemon	Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> now using Connection 29
default	16:46:24.988380-0500	RedLemon	Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:24.988590-0500	RedLemon	Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> now using Connection 29
default	16:46:24.990395-0500	RedLemon	0x7f7b9d6fc268 ID=12 Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> sent request, body N 0
default	16:46:24.991216-0500	RedLemon	0x7f7b9cbdf8c8 ID=16 Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> sent request, body N 0
default	16:46:24.995168-0500	RedLemon	0x7f7b9cbc9a98 ID=20 Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> sent request, body N 0
default	16:46:24.996855-0500	runningboardd	Attempting to rename power assertion 34228 for target anon<RedLemon>(501) to anon<RedLemon>(501)166-10341-2557:com.apple.CFNetwork.StorageDB
default	16:46:24.997025-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:24.997066-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:24.997103-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:25.059218-0500	RedLemon	0x7f7b9cbd9138 ID=8 Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> received response, status 200 content U
default	16:46:25.085125-0500	RedLemon	0x7f7b9d6abcd8 ID=0 Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> received response, status 200 content U
default	16:46:25.085918-0500	RedLemon	0x7f7b9cbf7fd8 ID=4 Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> received response, status 200 content K
default	16:46:25.088031-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> response ended
default	16:46:25.088324-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> done using Connection 29
default	16:46:25.088500-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> summary for task success {transaction_duration_ms=238, response_status=200, connection=29, reused=1, request_start_ms=65, request_duration_ms=1, response_start_ms=235, response_duration_ms=2, request_bytes=112, response_bytes=3271, cache_hit=true}
default	16:46:25.088879-0500	RedLemon	Task <3989189B-D91A-4D8C-B8E3-84023736E237>.<121> finished successfully
default	16:46:25.111602-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> response ended
default	16:46:25.111931-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> done using Connection 29
default	16:46:25.112149-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> summary for task success {transaction_duration_ms=266, response_status=200, connection=29, protocol="h3", domain_lookup_duration_ms=11, connect_duration_ms=43, secure_connection_duration_ms=41, private_relay=false, request_start_ms=69, request_duration_ms=2, response_start_ms=238, response_duration_ms=27, request_bytes=112, response_bytes=39898, cache_hit=true}
default	16:46:25.112359-0500	RedLemon	Task <DA5C8874-DCF2-466E-8D30-72A7C2F1EBDF>.<122> finished successfully
default	16:46:25.112833-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> response ended
default	16:46:25.113320-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> done using Connection 29
default	16:46:25.113570-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> summary for task success {transaction_duration_ms=262, response_status=200, connection=29, reused=1, request_start_ms=65, request_duration_ms=0, response_start_ms=207, response_duration_ms=54, request_bytes=112, response_bytes=91144, cache_hit=true}
default	16:46:25.114085-0500	RedLemon	Task <2EDEF8F7-AA1C-4DF2-A1A7-B602CA58FBD7>.<123> finished successfully
default	16:46:25.130317-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi9-4.download.real-debrid.com/d/BUMVRZJL7PS7483/Fr, subtitles: 3
default	16:46:25.198754-0500	RedLemon	✅ Stream ready, starting playback...
default	16:46:25.198982-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	16:46:25.199296-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7f7b9a0caa90>
default	16:46:25.199426-0500	RedLemon	   Is fullscreen: 0
default	16:46:25.199507-0500	RedLemon	   ✅ WindowManager: Toggling fullscreen ON
default	16:46:25.277981-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	16:46:25.286696-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	16:46:25.297328-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	16:46:25.297485-0500	RedLemon	🎉 Starting watch party sync - Room: UFEF, Host: NO
default	16:46:25.297722-0500	RedLemon	🎉 Watch Party Mode ENABLED. isInWatchParty = YES
default	16:46:25.390116-0500	RedLemon	🔄 Starting chat polling for room: UFEF
default	16:46:25.391330-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	16:46:25.392323-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	16:46:25.393177-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	16:46:25.394290-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	16:46:25.394828-0500	RedLemon	🎬🎬🎬 streamURL: https://chi9-4.download.real-debrid.com/d/BUMVRZJL7PS7483/Fr
default	16:46:25.395065-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	16:46:25.395792-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi9-4.download.real-debrid.com/d/BUMVRZJL7PS7483/Frankenstein%202025%201080p%20NF%20WEB-DL%, autoplay: false
default	16:46:25.396012-0500	RedLemon	⏸️ Loading in paused mode (watch party)
default	16:46:25.396231-0500	RedLemon	🔗 URL: https://chi9-4.download.real-debrid.com/d/BUMVRZJL7PS7483/Frankenstein%202025%201080p%20NF%20WEB-DL%20DDP5%201%20Atmos%20H%20264-FLUX.mkv
default	16:46:25.396514-0500	RedLemon	🎬 MPV executing: loadfile "https://chi9-4.download.real-debrid.com/d/BUMVRZJL7PS7483/Frankenstein%202025%201080p%20NF%20WEB-DL%20DDP5%201%20Atmos%20H%20264-FLUX.mkv"
default	16:46:25.397144-0500	RedLemon	🎬 MPV loadfile result: 0
default	16:46:25.397525-0500	RedLemon	✅ MPV loadfile succeeded (started paused)
default	16:46:25.397964-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	16:46:25.398327-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	16:46:25.410257-0500	runningboardd	Invalidating assertion 166-157-2504 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.WindowServer(88)>:157]
default	16:46:25.410936-0500	RedLemon	0x7f7b9d6fc268 ID=12 Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> received response, status 200 content U
default	16:46:25.411098-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.WindowServer(88)>:157] with description <RBSAssertionDescriptor| "AppVisible" ID:166-157-2558 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:25.411261-0500	runningboardd	Assertion 166-157-2558 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:25.431118-0500	RedLemon	Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> response ended
default	16:46:25.433028-0500	RedLemon	Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> done using Connection 29
default	16:46:25.438483-0500	RedLemon	Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> summary for task success {transaction_duration_ms=456, response_status=200, connection=29, reused=1, request_start_ms=2, request_duration_ms=5, response_start_ms=428, response_duration_ms=22, request_bytes=112, response_bytes=91139, cache_hit=true}
default	16:46:25.439002-0500	RedLemon	Task <DF779E9B-E32B-4632-B93B-98FF95900198>.<124> finished successfully
default	16:46:25.443876-0500	RedLemon	0x7f7b9cbc9a98 ID=20 Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> received response, status 200 content K
default	16:46:25.446340-0500	RedLemon	Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> response ended
default	16:46:25.449369-0500	RedLemon	Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> done using Connection 29
default	16:46:25.449954-0500	RedLemon	0x7f7b9cbdf8c8 ID=16 Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> received response, status 200 content U
default	16:46:25.450403-0500	RedLemon	Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> response ended
default	16:46:25.451757-0500	RedLemon	Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> summary for task success {transaction_duration_ms=466, response_status=200, connection=29, reused=1, request_start_ms=3, request_duration_ms=6, response_start_ms=454, response_duration_ms=10, request_bytes=112, response_bytes=3273, cache_hit=true}
default	16:46:25.452594-0500	RedLemon	Task <EDD37E0E-32C1-460A-9170-B89CD2B83C21>.<126> finished successfully
default	16:46:25.454051-0500	RedLemon	Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> done using Connection 29
default	16:46:25.456332-0500	RedLemon	Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> summary for task success {transaction_duration_ms=472, response_status=200, connection=29, reused=1, request_start_ms=3, request_duration_ms=4, response_start_ms=466, response_duration_ms=4, request_bytes=112, response_bytes=39899, cache_hit=true}
default	16:46:25.456836-0500	RedLemon	Task <31930E7A-6EB8-47B7-81BE-59D594677C96>.<125> finished successfully
default	16:46:25.462559-0500	mDNSResponder	[R3306] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, Addr) START PID[10341](RedLemon)
default	16:46:25.463643-0500	mDNSResponder	[R3307] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, AAAA) START PID[10341](RedLemon)
default	16:46:25.465290-0500	mDNSResponder	[R3306] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, Addr) STOP PID[10341](RedLemon)
default	16:46:25.465419-0500	mDNSResponder	[R3307] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, AAAA) STOP PID[10341](RedLemon)
default	16:46:25.481542-0500	RedLemon	Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:25.482220-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C74AC5B7-224B-4CBA-BA1C-3C2766B2C123] (reporting strategy default)> on Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> was not selected for reporting
default	16:46:25.485110-0500	RedLemon	Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:25.486922-0500	RedLemon	Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> now using Connection 3
default	16:46:25.489902-0500	RedLemon	0x7f7b9cbefe48 ID=324 Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> sent request, body N 0
default	16:46:25.491255-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_EA9FD340-CF03-4FD6-BABE-2AF0DD46A670/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	16:46:25.492717-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_EA9FD340-CF03-4
default	16:46:25.510035-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	16:46:25.525023-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	16:46:25.525459-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein (2025) eng): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_B7D66F2B-12D2-454D-8E85-F03F02538F7E/Frankenstein (2025) eng.srt
default	16:46:25.525731-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_B7D66F2B-12D2-4
default	16:46:25.563952-0500	RedLemon	0x7f7b9cbefe48 ID=324 Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> received response, status 200 content K
default	16:46:25.565267-0500	RedLemon	Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> response ended
default	16:46:25.565747-0500	RedLemon	Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> done using Connection 3
default	16:46:25.566389-0500	RedLemon	Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> summary for task success {transaction_duration_ms=83, response_status=200, connection=3, reused=1, request_start_ms=4, request_duration_ms=2, response_start_ms=81, response_duration_ms=2, request_bytes=530, response_bytes=664, cache_hit=false}
default	16:46:25.569335-0500	RedLemon	Task <1C3357EA-3404-4AAF-ABAB-A9F7153F0030>.<127> finished successfully
default	16:46:25.570630-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	16:46:25.571228-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_B4380808-9CB0-4F63-98F8-E627012CA43F/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	16:46:25.571670-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_B4380808-9CB0-4
default	16:46:25.593310-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	16:46:25.593643-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	16:46:25.671644-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:46:25.673233-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:46:25.674209-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: UFEF
default	16:46:25.674359-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:46:25.674451-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:46:25.694103-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:46:25.694988-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:46:25.695327-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: UFEF
default	16:46:25.695554-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:46:25.695693-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:46:25.713706-0500	RedLemon	🔍 DEBUG: Received sync message - type: playbackState, sender: UFEF
default	16:46:25.714302-0500	RedLemon	🔍 DEBUG: Received sync message - type: playbackState, sender: UFEF
default	16:46:25.727914-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi9-4.download.real-debrid.com/d/XU5XCGUGYX4TI83/Fr, subtitles: 3
default	16:46:25.846302-0500	RedLemon	Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:25.846957-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A77B5D4F-7A8A-4F9D-AA8C-2100CCBA8240] (reporting strategy default)> on Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> was not selected for reporting
default	16:46:25.847855-0500	RedLemon	Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:25.848023-0500	RedLemon	Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> now using Connection 17
default	16:46:25.848288-0500	RedLemon	Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> sent request, body N 0
default	16:46:25.857656-0500	RedLemon	Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> summary for task failure {transaction_duration_ms=10, response_status=-1, connection=17, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=0, response_duration_ms=0, request_bytes=41, response_bytes=0, cache_hit=false}
default	16:46:25.857728-0500	RedLemon	Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> done using Connection 17
default	16:46:25.857812-0500	RedLemon	Task <13813A01-5799-42B8-B6AF-F6180B7D80DD>.<128> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	16:46:25.885499-0500	runningboardd	Invalidating assertion 166-10341-2557 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:25.912271-0500	RedLemon	✅ Stream ready, starting playback...
default	16:46:25.912384-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	16:46:25.912950-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7f7b9a0caa90>
default	16:46:25.913671-0500	RedLemon	   Is fullscreen: 1
default	16:46:25.914201-0500	RedLemon	   ⚠️ WindowManager: Already in fullscreen
default	16:46:25.919228-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	16:46:25.928536-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	16:46:25.932154-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:46:25.932327-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:46:25.932712-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: UFEF
default	16:46:25.932841-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:46:25.932929-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:46:25.940243-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	16:46:25.940733-0500	RedLemon	🎉 Starting watch party sync - Room: UFEF, Host: NO
default	16:46:25.940917-0500	RedLemon	🎉 Watch Party Mode ENABLED. isInWatchParty = YES
default	16:46:25.949762-0500	runningboardd	Invalidating assertion 166-157-2558 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.WindowServer(88)>:157]
default	16:46:25.971755-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.WindowServer(88)>:157] with description <RBSAssertionDescriptor| "AppVisible" ID:166-157-2566 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:25.971899-0500	runningboardd	Assertion 166-157-2566 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:25.975562-0500	RedLemon	🔍 DEBUG: Received sync message - type: playbackState, sender: UFEF
default	16:46:25.982167-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> summary for task success {transaction_duration_ms=10911, response_status=101, connection=18, protocol="http/1.1", domain_lookup_duration_ms=4, connect_duration_ms=53, secure_connection_duration_ms=35, private_relay=false, request_start_ms=62, request_duration_ms=0, response_start_ms=181, response_duration_ms=0, request_bytes=828, response_bytes=850, cache_hit=false}
default	16:46:25.982304-0500	RedLemon	Task <D862FD26-477C-4CC0-AEFC-B742EC126849>.<1> finished successfully
default	16:46:25.982569-0500	RedLemon	Connection 18: cleaning up
default	16:46:25.982621-0500	RedLemon	[C18 5DF219FE-1275-47EC-919F-11CCE4C331B3 Hostname#3e78bf88:443 tcp, url hash: fb28feca, tls, definite, attribution: developer] cancel
default	16:46:25.982741-0500	RedLemon	[C18 5DF219FE-1275-47EC-919F-11CCE4C331B3 Hostname#3e78bf88:443 tcp, url hash: fb28feca, tls, definite, attribution: developer] cancelled
	[C18.1 52560BC5-EEA9-4E3E-A60A-D96368319FC0 10.0.0.113:57952<->IPv4#90b4c047:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 10.909s, DNS @0.000s took 0.004s, TCP @0.181s took 0.017s, TLS 1.3 took 0.001s
	bytes in/out: 7354/3024, packets in/out: 17/25, rtt: 0.024s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:25.984158-0500	RedLemon	nw_flow_disconnected [C18.1 IPv4#90b4c047:443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:46:25.984559-0500	RedLemon	nw_protocol_tcp_log_summary [C18.1:3] 
	[E7149EB4-EA14-434A-BE7D-B372FC3A9667 <private>:57952<-><private>:443]
	Init: 1, Conn_Time: 15.643ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 6, rtt: 24.281ms, rtt_var: 13.875ms rtt_nc: 23.750ms, rtt_var_nc: 15.750ms base rtt: 15ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:25.985133-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state cancelled
error	16:46:25.985270-0500	RedLemon	Read completed with an error <private>
default	16:46:25.985357-0500	RedLemon	Connection 18: done
default	16:46:25.985830-0500	RedLemon	tcp_output [C18.1:3] flags=[F.] seq=2721499681, ack=3110590998, win=2048 state=FIN_WAIT_1 rcv_nxt=3110590998, snd_una=2721499105
default	16:46:25.987936-0500	RedLemon	🔄 Starting chat polling for room: UFEF
default	16:46:25.988689-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	16:46:25.989073-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	16:46:25.989468-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	16:46:25.989907-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	16:46:25.990425-0500	RedLemon	🎬🎬🎬 streamURL: https://chi9-4.download.real-debrid.com/d/XU5XCGUGYX4TI83/Fr
default	16:46:25.990953-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	16:46:25.991664-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi9-4.download.real-debrid.com/d/XU5XCGUGYX4TI83/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.A, autoplay: false
default	16:46:25.992120-0500	RedLemon	⏸️ Loading in paused mode (watch party)
default	16:46:25.992261-0500	RedLemon	🔗 URL: https://chi9-4.download.real-debrid.com/d/XU5XCGUGYX4TI83/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	16:46:25.993868-0500	RedLemon	🎬 MPV executing: loadfile "https://chi9-4.download.real-debrid.com/d/XU5XCGUGYX4TI83/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv"
default	16:46:25.995727-0500	RedLemon	🎬 MPV loadfile result: 0
default	16:46:25.996424-0500	RedLemon	✅ MPV loadfile succeeded (started paused)
default	16:46:25.996880-0500	mDNSResponder	[R3308] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, Addr) START PID[10341](RedLemon)
default	16:46:25.997617-0500	mDNSResponder	[R3309] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, AAAA) START PID[10341](RedLemon)
default	16:46:25.998586-0500	mDNSResponder	[R3308] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, Addr) STOP PID[10341](RedLemon)
default	16:46:25.998656-0500	mDNSResponder	[R3309] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, AAAA) STOP PID[10341](RedLemon)
default	16:46:25.998295-0500	RedLemon	tcp_output [C18.1:3] flags=[FP.] seq=2721499519, ack=3110590998, win=2048 state=FIN_WAIT_1 rcv_nxt=3110590998, snd_una=2721499519
default	16:46:25.998006-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	16:46:25.998909-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	16:46:26.006495-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:26.006536-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:26.006573-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:26.008889-0500	runningboardd	Invalidating assertion 166-103-2556 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:26.012779-0500	RedLemon	tcp_input [C18.1:3] flags=[F.] seq=3110590998, ack=2721499682, win=16 state=FIN_WAIT_2 rcv_nxt=3110590998, snd_una=2721499682
default	16:46:26.015831-0500	RedLemon	Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:26.016524-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FE4B5F30-A6EA-495C-9B22-D7A0655C0ED1] (reporting strategy default)> on Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> was not selected for reporting
default	16:46:26.018986-0500	RedLemon	Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:26.019639-0500	RedLemon	Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> now using Connection 3
default	16:46:26.021733-0500	RedLemon	0x7f7b9d9563b8 ID=328 Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> sent request, body N 0
default	16:46:26.024563-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_8E02269C-F7C5-496D-888B-B4B05F925268/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	16:46:26.024924-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_8E02269C-F7C5-4
default	16:46:26.035388-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	16:46:26.036004-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_F3572412-7E1C-4EEF-97C7-3CC547695AED/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	16:46:26.036221-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_F3572412-7E1C-4
default	16:46:26.043916-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	16:46:26.044101-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein (2025) eng): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_A7A590D6-06DC-42C5-9559-C5F05264DAFC/Frankenstein (2025) eng.srt
default	16:46:26.044380-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_A7A590D6-06DC-4
default	16:46:26.052896-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	16:46:26.053108-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	16:46:26.058629-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:26.060548-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D1640128-B09B-4EE7-9EBC-66AC44461753] (reporting strategy default)> on Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> was not selected for reporting
default	16:46:26.061326-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:26.061499-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> now using Connection 17
default	16:46:26.062179-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> sent request, body N 0
default	16:46:26.088661-0500	RedLemon	0x7f7b9d9563b8 ID=328 Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> received response, status 200 content K
default	16:46:26.089306-0500	RedLemon	Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> response ended
default	16:46:26.089648-0500	RedLemon	Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> done using Connection 3
default	16:46:26.089904-0500	RedLemon	Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=2, response_start_ms=71, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	16:46:26.090070-0500	RedLemon	Task <D843D1ED-1060-400A-869D-FBBF3FAD09F1>.<129> finished successfully
default	16:46:26.091341-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2567 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:26.091655-0500	runningboardd	Assertion 166-10341-2567 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:26.094218-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:26.094407-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> received response, status 200 content K
default	16:46:26.094264-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:26.094304-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:26.099781-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> done using Connection 17
default	16:46:26.100999-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> response ended
default	16:46:26.102655-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> summary for task success {transaction_duration_ms=41, response_status=200, connection=17, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=33, response_duration_ms=7, request_bytes=41, response_bytes=117949, cache_hit=false}
default	16:46:26.102771-0500	RedLemon	Task <9E2CDD12-163D-438E-986B-FBC54C1A375A>.<130> finished successfully
default	16:46:26.105942-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2568 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:26.106137-0500	runningboardd	Assertion 166-103-2568 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:26.659881-0500	mDNSResponder	[R3310] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, Addr) START PID[10341](RedLemon)
default	16:46:26.661067-0500	mDNSResponder	[R3311] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, AAAA) START PID[10341](RedLemon)
default	16:46:26.662105-0500	mDNSResponder	[R3310] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, Addr) STOP PID[10341](RedLemon)
default	16:46:26.662256-0500	mDNSResponder	[R3311] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, AAAA) STOP PID[10341](RedLemon)
default	16:46:27.114450-0500	runningboardd	Invalidating assertion 166-10341-2567 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:27.290160-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:27.290203-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:27.290241-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:27.292670-0500	runningboardd	Invalidating assertion 166-103-2568 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:27.435965-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:27.436044-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:27.436116-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:27.989151-0500	RedLemon	Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:27.989456-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D02E6F13-AD1F-4A23-AF18-7375A8E437D2] (reporting strategy default)> on Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> was not selected for reporting
default	16:46:27.990166-0500	RedLemon	Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:27.990396-0500	RedLemon	Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> now using Connection 3
default	16:46:27.991125-0500	RedLemon	0x7f7b9d5af808 ID=332 Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> sent request, body N 0
default	16:46:28.059690-0500	RedLemon	0x7f7b9d5af808 ID=332 Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> received response, status 200 content K
default	16:46:28.060329-0500	RedLemon	Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> response ended
default	16:46:28.060787-0500	RedLemon	Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> done using Connection 3
default	16:46:28.060976-0500	RedLemon	Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> summary for task success {transaction_duration_ms=71, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=530, response_bytes=665, cache_hit=false}
default	16:46:28.061419-0500	RedLemon	Task <8B474916-9553-4D71-9506-E2E9E89737F3>.<131> finished successfully
default	16:46:28.063025-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2569 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:28.063268-0500	runningboardd	Assertion 166-10341-2569 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:28.064824-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:28.064871-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:28.065020-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:28.068288-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2570 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:28.068443-0500	runningboardd	Assertion 166-103-2570 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:28.071187-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:28.071223-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:28.071480-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:28.086793-0500	RedLemon	🔍 MPV track-list/count: 0
default	16:46:28.087044-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	16:46:28.144517-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:28.144805-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [480E42F9-2F3A-452A-B9C4-2E18C81F7AD3] (reporting strategy default)> on Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> was not selected for reporting
default	16:46:28.145462-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:28.146096-0500	RedLemon	Connection 31: enabling TLS
default	16:46:28.146141-0500	RedLemon	Connection 31: starting, TC(0x0)
default	16:46:28.146243-0500	RedLemon	[C31 19899496-8FF2-4215-A846-47F06A8723ED Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{55F25F4C-A345-45CD-8837-2A9E40EE3A5B}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:28.146323-0500	RedLemon	[C31 Hostname#6d693a93:443 initial path ((null))] event: path:start @0.000s
default	16:46:28.146646-0500	RedLemon	[C31 Hostname#6d693a93:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 31F05A32-3169-4316-915C-54A37E91D5F1
default	16:46:28.146799-0500	RedLemon	[C31 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:28.146831-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state preparing
default	16:46:28.147003-0500	mDNSResponder	[R3312] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:28.147000-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> setting up Connection 31
default	16:46:28.148235-0500	mDNSResponder	[R3312] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 10341 (RedLemon)
default	16:46:28.148646-0500	RedLemon	nw_endpoint_resolver_update [C31 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7a3df01a:443
default	16:46:28.148746-0500	RedLemon	[C31 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	16:46:28.149007-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 initial path ((null))] event: path:start @0.002s
default	16:46:28.149331-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: 12D7F05E-40F1-4D90-9EAE-3E196F69E0D7
default	16:46:28.149441-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	16:46:28.150175-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.003s
default	16:46:28.151016-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.004s
default	16:46:28.151137-0500	RedLemon	tcp_output [C31.1:3] flags=[S] seq=962858028, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=962858028
default	16:46:28.153332-0500	mDNSResponder	[R3313] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, Addr) START PID[10341](RedLemon)
default	16:46:28.154026-0500	mDNSResponder	[R3314] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'c90mmDieYIfjZRIcGi1H3g=='>, AAAA) START PID[10341](RedLemon)
default	16:46:28.154618-0500	mDNSResponder	[R3313] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, Addr) STOP PID[10341](RedLemon)
default	16:46:28.154702-0500	mDNSResponder	[R3314] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'knRkGYu4vWTiTEhZMshFug=='>, AAAA) STOP PID[10341](RedLemon)
default	16:46:28.277405-0500	RedLemon	tcp_input [C31.1:3] flags=[S.] seq=1016297304, ack=962858029, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=962858028
default	16:46:28.277605-0500	RedLemon	nw_flow_connected [C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:28.277837-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.131s
default	16:46:28.277987-0500	RedLemon	[C31 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.131s
default	16:46:28.278386-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C31.1:2][0x7f7b9cbf5880] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:28.278510-0500	RedLemon	boringssl_context_info_handler(2028) [C31.1:2][0x7f7b9cbf5880] Client handshake started
default	16:46:28.278675-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS client enter_early_data
default	16:46:28.278882-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS client read_server_hello
default	16:46:28.409252-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:28.409389-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:28.409944-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:28.410537-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:28.410882-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:28.410989-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:28.411868-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C31.1:2][0x7f7b9cbf5880] Performing external trust evaluation
default	16:46:28.412050-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C31.1:2][0x7f7b9cbf5880] Asyncing for external verify block
default	16:46:28.412220-0500	RedLemon	Connection 31: asked to evaluate TLS Trust
default	16:46:28.412556-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> auth completion disp=1 cred=0x0
default	16:46:28.418299-0500	RedLemon	Connection 31: TLS Trust result 0
default	16:46:28.418346-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C31.1:2][0x7f7b9cbf5880] Returning from external verify block with result: true
default	16:46:28.418395-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C31.1:2][0x7f7b9cbf5880] Certificate verification result: OK
default	16:46:28.418813-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:28.419054-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:28.419090-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:28.419121-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:28.419153-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:28.419267-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS 1.3 client done
default	16:46:28.419445-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS client finish_client_handshake
default	16:46:28.419502-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7f7b9cbf5880] Client handshake state: TLS client done
default	16:46:28.419537-0500	RedLemon	boringssl_context_info_handler(2034) [C31.1:2][0x7f7b9cbf5880] Client handshake done
default	16:46:28.420066-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C31.1:2][0x7f7b9cbf5880] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(141ms) flight_time(132ms) rtt(131ms) write_stalls(0) read_stalls(6)]
default	16:46:28.420274-0500	RedLemon	nw_flow_connected [C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:28.420526-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.274s
default	16:46:28.420789-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state ready
default	16:46:28.420833-0500	RedLemon	[C31 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.274s
default	16:46:28.420947-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.274s
default	16:46:28.421036-0500	RedLemon	[C31 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.274s
default	16:46:28.421375-0500	RedLemon	Connection 31: connected successfully
default	16:46:28.421411-0500	RedLemon	Connection 31: TLS handshake complete
default	16:46:28.421610-0500	RedLemon	Connection 31: ready C(N) E(N)
default	16:46:28.421767-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> now using Connection 31
default	16:46:28.421835-0500	RedLemon	Connection 31: received viability advisory(Y)
default	16:46:28.421997-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> sent request, body N 0
default	16:46:28.618105-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> received response, status 101 content U
default	16:46:28.618351-0500	RedLemon	🔍 MPV track-list/count: 3
default	16:46:28.618835-0500	RedLemon	🔍 Track 0 type: sub
default	16:46:28.618746-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> response ended
default	16:46:28.619097-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> done using Connection 31
default	16:46:28.619158-0500	RedLemon	✅ Found subtitle track: ID=1, lang=en, title=Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	16:46:28.619373-0500	RedLemon	🔍 Track 1 type: sub
default	16:46:28.619577-0500	RedLemon	✅ Found subtitle track: ID=2, lang=en, title=Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	16:46:28.619781-0500	RedLemon	🔍 Track 2 type: sub
default	16:46:28.620026-0500	RedLemon	✅ Found subtitle track: ID=3, lang=en, title=Frankenstein (2025) eng
default	16:46:28.620091-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.473s
default	16:46:28.620162-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state preparing
default	16:46:28.620215-0500	RedLemon	📊 Total subtitle tracks found: 4 (including Off if needed)
default	16:46:28.620318-0500	RedLemon	[C31 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.473s
default	16:46:28.621376-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.475s
default	16:46:28.621627-0500	RedLemon	[C31 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.475s
default	16:46:28.621793-0500	RedLemon	nw_flow_connected [C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:28.621968-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.475s
default	16:46:28.622024-0500	RedLemon	[C31 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.475s
default	16:46:28.622235-0500	RedLemon	nw_flow_connected [C31.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:28.622525-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.476s
default	16:46:28.622565-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state ready
default	16:46:28.622621-0500	RedLemon	[C31 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.476s
default	16:46:28.745311-0500	RedLemon	nw_flow_disconnected [C31.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	16:46:28.745830-0500	RedLemon	nw_protocol_tcp_log_summary [C31.1:3] 
	[BC83BC43-E48E-46EE-8871-9103534134F0 <private>:57956<-><private>:443]
	Init: 1, Conn_Time: 126.427ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 145.906ms, rtt_var: 30.125ms rtt_nc: 134.343ms, rtt_var_nc: 44.250ms base rtt: 121ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:28.746900-0500	RedLemon	[C31.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.600s, error Socket is not connected
default	16:46:28.746970-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state failed error Socket is not connected
default	16:46:28.747066-0500	RedLemon	[C31 Hostname#6d693a93:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.600s
error	16:46:28.747154-0500	RedLemon	nw_read_request_report [C31] Receive failed with error "Socket is not connected"
error	16:46:28.747253-0500	RedLemon	nw_flow_service_reads [C31.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	16:46:28.747347-0500	RedLemon	tcp_output [C31.1:3] flags=[R.] seq=962859214, ack=1016300335, win=2047 state=CLOSED rcv_nxt=1016300335, snd_una=962859083
default	16:46:28.747517-0500	RedLemon	tcp_input [C31.1:3] flags=[F.] seq=1016300335, ack=962859083, win=249 state=CLOSED rcv_nxt=1016300335, snd_una=962859083
error	16:46:28.747623-0500	RedLemon	Connection 31: received failure notification
default	16:46:28.747812-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> summary for task success {transaction_duration_ms=602, response_status=101, connection=31, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=270, secure_connection_duration_ms=141, private_relay=false, request_start_ms=276, request_duration_ms=0, response_start_ms=472, response_duration_ms=1, request_bytes=359, response_bytes=330, cache_hit=false}
default	16:46:28.747921-0500	RedLemon	Task <774BB4A9-925F-44F4-8141-6AA6FD5F33E0>.<1> finished successfully
error	16:46:28.747885-0500	RedLemon	nw_flow_add_write_request [C31.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	16:46:28.748176-0500	RedLemon	nw_write_request_report [C31] Send failed with error "Socket is not connected"
default	16:46:28.748246-0500	RedLemon	Connection 31: cleaning up
default	16:46:28.748301-0500	RedLemon	[C31 19899496-8FF2-4215-A846-47F06A8723ED Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancel
default	16:46:28.748406-0500	RedLemon	[C31 19899496-8FF2-4215-A846-47F06A8723ED Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancelled
	[C31.1 12D7F05E-40F1-4D90-9EAE-3E196F69E0D7 10.0.0.113:57956<->IPv4#7a3df01a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.602s, DNS @0.000s took 0.002s, TCP @0.475s took 0.127s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:28.748761-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state cancelled error Socket is not connected
default	16:46:28.748877-0500	RedLemon	Connection 31: done
default	16:46:28.797640-0500	RedLemon	 HALPlugInManagement::RegisterPlugIns: skipping in-process plug-ins
error	16:46:28.797708-0500	RedLemon	AddInstanceForFactory: No factory registered for id <CFUUID 0x7f7b9f948e60> F8BB1C28-BAE8-11D6-9C31-00039315CD46
default	16:46:28.838207-0500	RedLemon	                AUHAL.cpp:386   AUHAL: (0x7f7b9b027a40) Listening to HAL system property 1682929012
default	16:46:28.838304-0500	RedLemon	                AUHAL.cpp:397   AUHAL: (0x7f7b9b027a40) Selecting device 49 from constructor
default	16:46:28.838385-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7f7b9b027a40)
default	16:46:28.838421-0500	RedLemon	                AUHAL.cpp:627   SelectDevice: (0x7f7b9b027a40) not already running
default	16:46:28.838449-0500	RedLemon	                AUHAL.cpp:702   SelectDevice: (0x7f7b9b027a40) nothing to teardown
default	16:46:28.838476-0500	RedLemon	                AUHAL.cpp:706   SelectDevice: (0x7f7b9b027a40) connecting device 49
default	16:46:28.838676-0500	RedLemon	                AUHAL.cpp:3107  IsDeviceUsable: (0x7f7b9b027a40) Device ID: 49 (Input:No | Output:Yes): true
default	16:46:28.838891-0500	RedLemon	                AUHAL.cpp:716   SelectDevice: (0x7f7b9b027a40) created ioproc 0xa for device 49
default	16:46:28.838927-0500	RedLemon	                AUHAL.cpp:1452  UpdateStreamFormats: -> (0x7f7b9b027a40)
default	16:46:28.839112-0500	RedLemon	                AUHAL.cpp:1516  UpdateStreamFormats: 
  output stream 0 [0x32]:  2 ch,  44100 Hz, Float32, interleaved
default	16:46:28.839149-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 1 output streams; not all mono
default	16:46:28.839181-0500	RedLemon	                AUHAL.cpp:1537  UpdateStreamFormats: 
  Output render format:  2 ch,  44100 Hz, Float32, interleaved
default	16:46:28.839217-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 0 input streams; not all mono
default	16:46:28.839462-0500	RedLemon	                AUHAL.cpp:1602  UpdateStreamFormats: AUHAL(0x7f7b9b027a40) Calling PropertyChanged() for kAudioUnitProperty_StreamFormat, Scope:Output, Bus:Output
default	16:46:28.839555-0500	RedLemon	                AUHAL.cpp:1615  UpdateStreamFormats: <-
default	16:46:28.840138-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7f7b9b027a40) removing 0 device listeners from device 0
default	16:46:28.840177-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7f7b9b027a40) adding 6 device listeners to device 49
default	16:46:28.840581-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7f7b9b027a40) removing 0 device delegate listeners from device 0
default	16:46:28.840642-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7f7b9b027a40) adding 0 device delegate listeners to device 49
default	16:46:28.840713-0500	RedLemon	                AUHAL.cpp:842   SelectDevice: <- (0x7f7b9b027a40)
default	16:46:28.841167-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	16:46:28.842866-0500	RedLemon	Registered notify signal com.apple.caulk.alloc.audiodump (0)
default	16:46:28.843698-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	16:46:28.843926-0500	RedLemon	                AUHAL.cpp:2060  SetProperty: (0x7f7b9b027a40) caller requesting device change from 49 to 49
default	16:46:28.843980-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7f7b9b027a40)
default	16:46:28.844017-0500	RedLemon	                AUHAL.cpp:613   SelectDevice: <- (0x7f7b9b027a40) exiting with nothing to do
default	16:46:29.076364-0500	runningboardd	Invalidating assertion 166-10341-2569 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:29.078607-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: NO
default	16:46:29.078717-0500	RedLemon	⏱️ Watch Party: Duration available (9145.8s), triggering ready signal
default	16:46:29.078810-0500	RedLemon	👋 Watch Party: Sending READY signal
default	16:46:29.169404-0500	RedLemon	⚠️ Realtime: Cannot send sync message - not connected
default	16:46:29.179276-0500	RedLemon	✅ Watch Party: READY signal sent successfully
default	16:46:29.186229-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:29.186271-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:29.186312-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:29.188672-0500	runningboardd	Invalidating assertion 166-103-2570 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:29.191055-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: YES
default	16:46:29.291146-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:29.291184-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:29.291224-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:29.707313-0500	RedLemon	🔍 MPV track-list/count: 0
default	16:46:29.707617-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	16:46:29.983268-0500	RedLemon	tcp_input [C26.1.1:3] flags=[FP.] seq=1822955895, ack=3183739963, win=501 state=ESTABLISHED rcv_nxt=1822955895, snd_una=3183739963
default	16:46:29.983395-0500	RedLemon	nw_protocol_tcp_log_summary [C26.1.1:3] 
	[0EC77FEA-3AE3-4FFD-8A95-D6DBC042F687 <private>:49318<-><private>:443]
	Init: 1, Conn_Time: 110.749ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/1/1, TS: 0
	rtt_cache: kernel, rtt_upd: 13, rtt: 130.156ms, rtt_var: 27.937ms rtt_nc: 124.281ms, rtt_var_nc: 23.250ms base rtt: 100ms
	ACKs-compressed: 0, ACKs delayed: 3 delayed ACKs sent: 0
default	16:46:29.985089-0500	RedLemon	Connection 26: read-side closed
default	16:46:29.985229-0500	RedLemon	Connection 26: read-side closed
default	16:46:29.985282-0500	RedLemon	Connection 26: read-side closed
default	16:46:29.985657-0500	RedLemon	Connection 26: cleaning up
default	16:46:29.985769-0500	RedLemon	[C26 0554B3FA-A5C9-4452-8C57-700EB45E67F1 Hostname#706dc610:443 quic-connection, url hash: 718812b8, definite, attribution: developer] cancel
default	16:46:29.985975-0500	RedLemon	[C26 0554B3FA-A5C9-4452-8C57-700EB45E67F1 Hostname#706dc610:443 quic-connection, url hash: 718812b8, definite, attribution: developer] cancelled
	[C26.1.1 C4FB76F5-0F77-432B-AD76-8751010DC738 2607:fea8:995b:fd00:e5b1:b708:1baf:225d.49318<->IPv6#c6625149.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 7.092s, DNS @0.001s took 0.024s, TCP @0.027s took 0.111s, TLS 1.3 took 0.126s
	bytes in/out: 9006/2898, packets in/out: 29/34, rtt: 0.130s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:29.987211-0500	RedLemon	nw_flow_disconnected [C26.1.1 IPv6#c6625149.443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:46:29.988126-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C26] reporting state cancelled
default	16:46:29.988333-0500	RedLemon	tcp_output [C26.1.1:3] flags=[FP.] seq=3183740002, ack=1822955920, win=4096 state=LAST_ACK rcv_nxt=1822955920, snd_una=3183739963
default	16:46:29.989469-0500	RedLemon	Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:29.990124-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C10BD2A4-4054-4CA1-B4D4-461223583AD6] (reporting strategy default)> on Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> was not selected for reporting
default	16:46:29.990926-0500	RedLemon	Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:29.991189-0500	RedLemon	Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> now using Connection 3
default	16:46:29.992080-0500	RedLemon	0x7f7b9cc80d88 ID=336 Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> sent request, body N 0
default	16:46:30.064640-0500	RedLemon	0x7f7b9cc80d88 ID=336 Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> received response, status 200 content K
default	16:46:30.065206-0500	RedLemon	Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> response ended
default	16:46:30.065603-0500	RedLemon	Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> done using Connection 3
default	16:46:30.065933-0500	RedLemon	Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> summary for task success {transaction_duration_ms=75, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=1, request_bytes=530, response_bytes=662, cache_hit=false}
default	16:46:30.066119-0500	RedLemon	Task <0CD7D301-5265-47FD-87E2-C8A927FF5B21>.<132> finished successfully
default	16:46:30.067230-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2571 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:30.067410-0500	runningboardd	Assertion 166-10341-2571 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:30.070223-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:30.070303-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:30.070430-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:30.074795-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2572 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:30.074995-0500	runningboardd	Assertion 166-103-2572 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:30.076633-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:30.076678-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:30.076725-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:31.077997-0500	runningboardd	Invalidating assertion 166-10341-2571 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:31.208311-0500	RedLemon	🔍 MPV track-list/count: 0
default	16:46:31.208535-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	16:46:31.216836-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:31.216886-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:31.217021-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:31.218615-0500	runningboardd	Invalidating assertion 166-103-2572 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:31.328640-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:31.328716-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:31.328788-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:31.620543-0500	RedLemon	✅ Exit button triggered! x=319 <= 320, y=678 >= 600
default	16:46:31.634282-0500	RedLemon	✅ Exit button triggered! x=319 <= 320, y=677 >= 600
default	16:46:31.635416-0500	RedLemon	✅ Exit button triggered! x=319 <= 320, y=676 >= 600
default	16:46:31.643492-0500	RedLemon	✅ Exit button triggered! x=320 <= 320, y=674 >= 600
default	16:46:31.988943-0500	RedLemon	Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:31.989435-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B29BCC8E-F1FE-4ED9-A63E-C1D339336FFA] (reporting strategy default)> on Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> was not selected for reporting
default	16:46:31.990098-0500	RedLemon	Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:31.990360-0500	RedLemon	Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> now using Connection 3
default	16:46:31.991411-0500	RedLemon	0x7f7b9e8253f8 ID=340 Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> sent request, body N 0
default	16:46:32.061204-0500	RedLemon	0x7f7b9e8253f8 ID=340 Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> received response, status 200 content K
default	16:46:32.061827-0500	RedLemon	Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> response ended
default	16:46:32.062251-0500	RedLemon	Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> done using Connection 3
default	16:46:32.062506-0500	RedLemon	Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=71, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	16:46:32.063065-0500	RedLemon	Task <0688D0F5-192D-480F-9A58-F4C601257BB5>.<133> finished successfully
default	16:46:32.065242-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2573 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:32.065479-0500	runningboardd	Assertion 166-10341-2573 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:32.066790-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:32.066975-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:32.067147-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:32.073617-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2574 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:32.074048-0500	runningboardd	Assertion 166-103-2574 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:32.077841-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:32.077882-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:32.077922-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:32.603401-0500	RedLemon	Task <B5ADF6F7-E1E4-4AD6-A94F-16395E89DA28>.<134> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:32.603645-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [ABCC7B3E-59AB-48FF-BDFA-10737A45174D] (reporting strategy default)> on Task <B5ADF6F7-E1E4-4AD6-A94F-16395E89DA28>.<134> was not selected for reporting
default	16:46:32.605547-0500	RedLemon	Task <B5ADF6F7-E1E4-4AD6-A94F-16395E89DA28>.<134> summary for task success {transaction_duration_ms=1, response_status=200, cache_hit=true}
default	16:46:32.605684-0500	RedLemon	Task <B5ADF6F7-E1E4-4AD6-A94F-16395E89DA28>.<134> finished successfully
default	16:46:33.078663-0500	runningboardd	Invalidating assertion 166-10341-2573 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:33.256230-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:33.256275-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:33.256316-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:33.258095-0500	runningboardd	Invalidating assertion 166-103-2574 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:33.433676-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:33.433726-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:33.433772-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:33.473783-0500	RedLemon	🖱️ Mouse: x=603/1280 y=0/800 | Exit: 0 Controls: 1 Chat: 0
default	16:46:33.989733-0500	RedLemon	Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:33.990354-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4BA539A6-8286-4AC3-94AA-002E9C9D1384] (reporting strategy default)> on Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> was not selected for reporting
default	16:46:33.991136-0500	RedLemon	Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:33.991403-0500	RedLemon	Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> now using Connection 3
default	16:46:33.992454-0500	RedLemon	0x7f7b9d5e0a68 ID=344 Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> sent request, body N 0
default	16:46:34.059118-0500	RedLemon	0x7f7b9d5e0a68 ID=344 Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> received response, status 200 content K
default	16:46:34.059706-0500	RedLemon	Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> response ended
default	16:46:34.060100-0500	RedLemon	Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> done using Connection 3
default	16:46:34.060282-0500	RedLemon	Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=68, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=true}
default	16:46:34.060714-0500	RedLemon	Task <7B470261-1CE9-4201-B2D5-5A8ADAA06464>.<135> finished successfully
default	16:46:34.062297-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2576 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:34.062905-0500	runningboardd	Assertion 166-10341-2576 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:34.064327-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:34.064717-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:34.064778-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:34.067760-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2577 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:34.067958-0500	runningboardd	Assertion 166-103-2577 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:34.069363-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:34.069412-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:34.069456-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:35.071073-0500	runningboardd	Invalidating assertion 166-10341-2576 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:35.210705-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:35.210772-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:35.210834-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:35.213295-0500	runningboardd	Invalidating assertion 166-103-2577 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:35.385941-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:35.386006-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:35.386050-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:35.988941-0500	RedLemon	Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:35.989481-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BC3B1113-54ED-4A77-9A84-5E33A82B4997] (reporting strategy default)> on Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> was not selected for reporting
default	16:46:35.990509-0500	RedLemon	Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:35.990811-0500	RedLemon	Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> now using Connection 3
default	16:46:35.991736-0500	RedLemon	0x7f7b9cbf7e28 ID=348 Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> sent request, body N 0
default	16:46:36.063229-0500	RedLemon	0x7f7b9cbf7e28 ID=348 Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> received response, status 200 content K
default	16:46:36.063935-0500	RedLemon	Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> response ended
default	16:46:36.064323-0500	RedLemon	Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> done using Connection 3
default	16:46:36.064522-0500	RedLemon	Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> summary for task success {transaction_duration_ms=74, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=72, response_duration_ms=1, request_bytes=530, response_bytes=662, cache_hit=false}
default	16:46:36.064733-0500	RedLemon	Task <1F3EEB3E-5BB0-4652-A156-1109B3651CDE>.<136> finished successfully
default	16:46:36.066355-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2578 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:36.066744-0500	runningboardd	Assertion 166-10341-2578 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:36.068074-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:36.068129-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:36.068176-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:36.073656-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2579 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:36.074908-0500	runningboardd	Assertion 166-103-2579 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:36.077831-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:36.078023-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:36.078130-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:36.106717-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	16:46:37.077070-0500	runningboardd	Invalidating assertion 166-10341-2578 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:37.198657-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:37.198738-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:37.198811-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:37.200766-0500	runningboardd	Invalidating assertion 166-103-2579 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:37.341057-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:37.341128-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:37.341201-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:37.990142-0500	RedLemon	Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:37.990787-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [47542567-79D0-484A-98A0-4F26329B64E8] (reporting strategy default)> on Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> was not selected for reporting
default	16:46:37.992208-0500	RedLemon	Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:37.993010-0500	RedLemon	Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> now using Connection 3
default	16:46:37.994631-0500	RedLemon	0x7f7b9a353728 ID=352 Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> sent request, body N 0
default	16:46:38.067411-0500	RedLemon	0x7f7b9a353728 ID=352 Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> received response, status 200 content K
default	16:46:38.068110-0500	RedLemon	Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> response ended
default	16:46:38.068500-0500	RedLemon	Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> done using Connection 3
default	16:46:38.068831-0500	RedLemon	Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> summary for task success {transaction_duration_ms=77, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=75, response_duration_ms=1, request_bytes=530, response_bytes=664, cache_hit=true}
default	16:46:38.069286-0500	RedLemon	Task <610F2FD6-6F60-4894-BAAC-25E0EAC78B58>.<137> finished successfully
default	16:46:38.070425-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2580 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:38.070965-0500	runningboardd	Assertion 166-10341-2580 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:38.075308-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:38.075381-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:38.075452-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:38.078654-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2581 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:38.078871-0500	runningboardd	Assertion 166-103-2581 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:38.079596-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:38.079648-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:38.079694-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:39.078777-0500	runningboardd	Invalidating assertion 166-10341-2580 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:39.232579-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:39.232670-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:39.232759-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:39.234812-0500	runningboardd	Invalidating assertion 166-103-2581 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:39.408859-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:39.409029-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:39.409118-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:39.989738-0500	RedLemon	Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:39.990494-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [21256863-23C3-424B-9690-FE9DF4B07CDE] (reporting strategy default)> on Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> was not selected for reporting
default	16:46:39.991482-0500	RedLemon	Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:39.991796-0500	RedLemon	Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> now using Connection 3
default	16:46:39.993098-0500	RedLemon	0x7f7b9d55f798 ID=356 Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> sent request, body N 0
default	16:46:40.060184-0500	RedLemon	0x7f7b9d55f798 ID=356 Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> received response, status 200 content K
default	16:46:40.060806-0500	RedLemon	Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> response ended
default	16:46:40.061187-0500	RedLemon	Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> done using Connection 3
default	16:46:40.061381-0500	RedLemon	Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=69, response_duration_ms=1, request_bytes=530, response_bytes=660, cache_hit=false}
default	16:46:40.061595-0500	RedLemon	Task <9ECF411C-6E1B-45F1-B3A4-FEE141D41A1B>.<138> finished successfully
default	16:46:40.062876-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2582 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:40.063118-0500	runningboardd	Assertion 166-10341-2582 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:40.064498-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:40.064549-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:40.064594-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:40.068922-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2583 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:40.069211-0500	runningboardd	Assertion 166-103-2583 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:40.070477-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:40.070543-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:40.070589-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:40.931969-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:40.932501-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [675DB9CB-CEF8-4B71-B248-213C141A0E7A] (reporting strategy default)> on Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> was not selected for reporting
default	16:46:40.933578-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:40.934314-0500	RedLemon	Connection 32: enabling TLS
default	16:46:40.934379-0500	RedLemon	Connection 32: starting, TC(0x0)
default	16:46:40.934464-0500	RedLemon	[C32 4F885E6B-5AFF-459A-A10A-6041D81B275D Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{D22717BB-F1F5-4721-AE33-2A55E0C86B76}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:40.934601-0500	RedLemon	[C32 Hostname#6d693a93:443 initial path ((null))] event: path:start @0.000s
default	16:46:40.935105-0500	RedLemon	[C32 Hostname#6d693a93:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 8A6F5C68-FCC9-4877-B6D0-F6F45F565BF8
default	16:46:40.935422-0500	RedLemon	[C32 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:40.935497-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state preparing
default	16:46:40.935776-0500	mDNSResponder	[R3321] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:40.935790-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> setting up Connection 32
default	16:46:40.937046-0500	mDNSResponder	[R3321] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 10341 (RedLemon)
default	16:46:40.937233-0500	RedLemon	nw_endpoint_resolver_update [C32 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7a3df01a:443
default	16:46:40.937359-0500	RedLemon	[C32 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	16:46:40.937593-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 initial path ((null))] event: path:start @0.003s
default	16:46:40.937958-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: 4E305065-33D1-4C5E-910C-21744673FBFE
default	16:46:40.938098-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	16:46:40.938556-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.004s
default	16:46:40.939052-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.004s
default	16:46:40.939146-0500	RedLemon	tcp_output [C32.1:3] flags=[S] seq=273482720, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=273482720
default	16:46:41.069762-0500	runningboardd	Invalidating assertion 166-10341-2582 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:41.110503-0500	RedLemon	tcp_input [C32.1:3] flags=[S.] seq=1112129034, ack=273482721, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=273482720
default	16:46:41.110640-0500	RedLemon	nw_flow_connected [C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:41.110781-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.176s
default	16:46:41.110837-0500	RedLemon	[C32 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.176s
default	16:46:41.111196-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C32.1:2][0x7f7b9d93ff00] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:41.111301-0500	RedLemon	boringssl_context_info_handler(2028) [C32.1:2][0x7f7b9d93ff00] Client handshake started
default	16:46:41.111479-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS client enter_early_data
default	16:46:41.111598-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS client read_server_hello
default	16:46:41.111923-0500	RedLemon	tcp_input [C17.1.1:3] flags=[F.] seq=2241740192, ack=2441289003, win=8 state=ESTABLISHED rcv_nxt=2241740192, snd_una=2441289003
default	16:46:41.112010-0500	RedLemon	nw_protocol_tcp_log_summary [C17.1.1:3] 
	[2B0DB364-CA08-4E6E-BAA1-E55C2CA1F442 <private>:49315<-><private>:443]
	Init: 1, Conn_Time: 13.781ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/1/1, TS: 1
	rtt_cache: kernel, rtt_upd: 10, rtt: 34.906ms, rtt_var: 21.437ms rtt_nc: 30.718ms, rtt_var_nc: 20.937ms base rtt: 9ms
	ACKs-compressed: 0, ACKs delayed: 42 delayed ACKs sent: 0
default	16:46:41.113116-0500	RedLemon	Connection 17: read-side closed
default	16:46:41.113183-0500	RedLemon	Connection 17: read-side closed
default	16:46:41.113214-0500	RedLemon	Connection 17: read-side closed
default	16:46:41.113454-0500	RedLemon	Connection 17: cleaning up
default	16:46:41.113524-0500	RedLemon	[C17 5152C165-C3C9-4888-8DCD-91ADFF74DBBE Hostname#853c3608:443 quic-connection, url hash: 1728aed7, definite, attribution: developer] cancel
default	16:46:41.113641-0500	RedLemon	[C17 5152C165-C3C9-4888-8DCD-91ADFF74DBBE Hostname#853c3608:443 quic-connection, url hash: 1728aed7, definite, attribution: developer] cancelled
	[C17.1.1 86550D1F-50B6-46DC-B56E-5E1185CA0CA1 2607:fea8:995b:fd00:e5b1:b708:1baf:225d.49315<->IPv6#9d73c199.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 26.124s, DNS @0.002s took 0.048s, TCP @0.053s took 0.014s, TLS 1.3 took 0.058s
	bytes in/out: 603027/1193, packets in/out: 99/108, rtt: 0.034s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:41.114196-0500	RedLemon	nw_flow_disconnected [C17.1.1 IPv6#9d73c199.443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:46:41.114362-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C17] reporting state cancelled
default	16:46:41.114478-0500	RedLemon	Connection 17: done
default	16:46:41.114531-0500	RedLemon	tcp_output [C17.1.1:3] flags=[FP.] seq=2441289042, ack=2241740193, win=11330 state=LAST_ACK rcv_nxt=2241740193, snd_una=2441289003
default	16:46:41.200679-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:41.200830-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:41.200990-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:41.202559-0500	runningboardd	Invalidating assertion 166-103-2583 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:41.240446-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:41.240731-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:41.241466-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:41.242619-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:41.243333-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:41.243396-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:41.244035-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C32.1:2][0x7f7b9d93ff00] Performing external trust evaluation
default	16:46:41.244178-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C32.1:2][0x7f7b9d93ff00] Asyncing for external verify block
default	16:46:41.244338-0500	RedLemon	Connection 32: asked to evaluate TLS Trust
default	16:46:41.244668-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> auth completion disp=1 cred=0x0
default	16:46:41.250737-0500	RedLemon	Connection 32: TLS Trust result 0
default	16:46:41.250785-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C32.1:2][0x7f7b9d93ff00] Returning from external verify block with result: true
default	16:46:41.250830-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C32.1:2][0x7f7b9d93ff00] Certificate verification result: OK
default	16:46:41.251135-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:41.251276-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:41.251292-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:41.251308-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:41.251326-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:41.251518-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS 1.3 client done
default	16:46:41.251703-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS client finish_client_handshake
default	16:46:41.251744-0500	RedLemon	boringssl_context_info_handler(2045) [C32.1:2][0x7f7b9d93ff00] Client handshake state: TLS client done
default	16:46:41.251810-0500	RedLemon	boringssl_context_info_handler(2034) [C32.1:2][0x7f7b9d93ff00] Client handshake done
default	16:46:41.252482-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C32.1:2][0x7f7b9d93ff00] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(141ms) flight_time(131ms) rtt(129ms) write_stalls(0) read_stalls(7)]
default	16:46:41.252676-0500	RedLemon	nw_flow_connected [C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:41.253108-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.318s
default	16:46:41.253434-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state ready
default	16:46:41.253509-0500	RedLemon	[C32 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.318s
default	16:46:41.253618-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.319s
default	16:46:41.253673-0500	RedLemon	[C32 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.319s
default	16:46:41.253966-0500	RedLemon	Connection 32: connected successfully
default	16:46:41.254008-0500	RedLemon	Connection 32: TLS handshake complete
default	16:46:41.254226-0500	RedLemon	Connection 32: ready C(N) E(N)
default	16:46:41.254401-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> now using Connection 32
default	16:46:41.254481-0500	RedLemon	Connection 32: received viability advisory(Y)
default	16:46:41.254690-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> sent request, body N 0
default	16:46:41.333504-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:41.333579-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:41.333652-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:41.418278-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> received response, status 101 content U
default	16:46:41.418463-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> response ended
default	16:46:41.418514-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> done using Connection 32
default	16:46:41.419039-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.484s
default	16:46:41.419075-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state preparing
default	16:46:41.419138-0500	RedLemon	[C32 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.484s
default	16:46:41.419259-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.484s
default	16:46:41.419307-0500	RedLemon	[C32 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.484s
default	16:46:41.419373-0500	RedLemon	nw_flow_connected [C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:41.419486-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.484s
default	16:46:41.419537-0500	RedLemon	[C32 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.484s
default	16:46:41.419653-0500	RedLemon	nw_flow_connected [C32.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:41.419900-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.485s
default	16:46:41.419935-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state ready
default	16:46:41.419987-0500	RedLemon	[C32 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.485s
default	16:46:41.555627-0500	RedLemon	nw_flow_disconnected [C32.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	16:46:41.556246-0500	RedLemon	nw_protocol_tcp_log_summary [C32.1:3] 
	[60C1D573-B6EA-4549-B4FD-F774C4274ED6 <private>:57957<-><private>:443]
	Init: 1, Conn_Time: 171.477ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 147.687ms, rtt_var: 22.187ms rtt_nc: 162.437ms, rtt_var_nc: 50.500ms base rtt: 127ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:41.556749-0500	RedLemon	tcp_input [C32.1:3] flags=[F.] seq=1112132064, ack=273483773, win=249 state=ESTABLISHED rcv_nxt=1112132064, snd_una=273483773
default	16:46:41.557305-0500	RedLemon	[C32.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.622s, error Socket is not connected
default	16:46:41.557332-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state failed error Socket is not connected
default	16:46:41.557379-0500	RedLemon	[C32 Hostname#6d693a93:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.622s
error	16:46:41.557414-0500	RedLemon	nw_read_request_report [C32] Receive failed with error "Socket is not connected"
error	16:46:41.557496-0500	RedLemon	nw_flow_service_reads [C32.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	16:46:41.557533-0500	RedLemon	tcp_output [C32.1:3] flags=[R.] seq=273483904, ack=1112132065, win=2047 state=CLOSED rcv_nxt=1112132065, snd_una=273483773
error	16:46:41.557646-0500	RedLemon	Connection 32: received failure notification
error	16:46:41.558011-0500	RedLemon	nw_flow_add_write_request [C32.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	16:46:41.558079-0500	RedLemon	nw_write_request_report [C32] Send failed with error "Socket is not connected"
default	16:46:41.558130-0500	RedLemon	Connection 32: cleaning up
default	16:46:41.558178-0500	RedLemon	[C32 4F885E6B-5AFF-459A-A10A-6041D81B275D Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancel
default	16:46:41.558301-0500	RedLemon	[C32 4F885E6B-5AFF-459A-A10A-6041D81B275D Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancelled
	[C32.1 4E305065-33D1-4C5E-910C-21744673FBFE 10.0.0.113:57957<->IPv4#7a3df01a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.623s, DNS @0.000s took 0.002s, TCP @0.484s took 0.172s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:41.557807-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> summary for task success {transaction_duration_ms=624, response_status=101, connection=32, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=314, secure_connection_duration_ms=141, private_relay=false, request_start_ms=321, request_duration_ms=0, response_start_ms=485, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	16:46:41.558490-0500	RedLemon	Task <4BC484F9-2248-4AF7-B587-166024BD674D>.<1> finished successfully
default	16:46:41.559091-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state cancelled error Socket is not connected
default	16:46:41.559360-0500	RedLemon	Connection 32: done
default	16:46:41.990365-0500	RedLemon	Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:41.990897-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [377E91F8-7E5C-4000-82D0-010841B46142] (reporting strategy default)> on Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> was not selected for reporting
default	16:46:41.991981-0500	RedLemon	Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:41.992474-0500	RedLemon	Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> now using Connection 3
default	16:46:41.994398-0500	RedLemon	0x7f7b9d59f468 ID=360 Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> sent request, body N 0
default	16:46:42.061871-0500	RedLemon	0x7f7b9d59f468 ID=360 Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> received response, status 200 content K
default	16:46:42.062632-0500	RedLemon	Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> response ended
default	16:46:42.063051-0500	RedLemon	Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> done using Connection 3
default	16:46:42.063241-0500	RedLemon	Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> summary for task success {transaction_duration_ms=71, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=530, response_bytes=660, cache_hit=false}
default	16:46:42.063481-0500	RedLemon	Task <81546012-9116-48B0-86FA-3CB4FC89ED14>.<139> finished successfully
default	16:46:42.064855-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2585 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:42.065701-0500	runningboardd	Assertion 166-10341-2585 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:42.067204-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:42.067420-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:42.067529-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:42.069511-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2586 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:42.069653-0500	runningboardd	Assertion 166-103-2586 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:42.070858-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:42.070899-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:42.070936-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:42.451280-0500	runningboardd	Invalidating assertion 166-129-2541 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	16:46:42.573335-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:42.573410-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:42.573488-0500	runningboardd	[anon<RedLemon>(501):10341] Set darwin role to: UserInteractiveNonFocal
default	16:46:42.573529-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:42.728280-0500	runningboardd	Invalidating assertion 166-157-2566 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.WindowServer(88)>:157]
default	16:46:42.852674-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:42.852787-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:42.852890-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:43.077145-0500	runningboardd	Invalidating assertion 166-10341-2585 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:43.197227-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:43.197299-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:43.197351-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:43.198649-0500	runningboardd	Invalidating assertion 166-103-2586 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:43.327980-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:43.328037-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:43.328083-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:43.990407-0500	RedLemon	Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:43.991018-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [00DF0033-E808-4E0B-8310-8B4EDF559531] (reporting strategy default)> on Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> was not selected for reporting
default	16:46:43.992125-0500	RedLemon	Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:43.992460-0500	RedLemon	Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> now using Connection 3
default	16:46:43.994673-0500	RedLemon	0x7f7b9ccacba8 ID=364 Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> sent request, body N 0
default	16:46:44.066139-0500	RedLemon	0x7f7b9ccacba8 ID=364 Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> received response, status 200 content K
default	16:46:44.067148-0500	RedLemon	Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> response ended
default	16:46:44.067504-0500	RedLemon	Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> done using Connection 3
default	16:46:44.068959-0500	RedLemon	Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> summary for task success {transaction_duration_ms=77, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=74, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=true}
default	16:46:44.071335-0500	RedLemon	Task <E9C6720C-3F42-4F22-8742-705762AAF396>.<140> finished successfully
default	16:46:44.072959-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2606 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:44.073344-0500	runningboardd	Assertion 166-10341-2606 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:44.075884-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:44.076066-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:44.076195-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:44.079938-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2607 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:44.080127-0500	runningboardd	Assertion 166-103-2607 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:44.081003-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:44.081048-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:44.081089-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:45.138170-0500	runningboardd	Invalidating assertion 166-10341-2606 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:45.296750-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:45.296797-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:45.296847-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:45.298367-0500	runningboardd	Invalidating assertion 166-103-2607 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:45.432980-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:45.433232-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:45.433331-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:45.990467-0500	RedLemon	Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:45.991064-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [373B9019-FBF0-4CBC-A65C-67A767B46808] (reporting strategy default)> on Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> was not selected for reporting
default	16:46:45.992043-0500	RedLemon	Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:45.992351-0500	RedLemon	Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> now using Connection 3
default	16:46:45.993841-0500	RedLemon	0x7f7b9ccacba8 ID=368 Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> sent request, body N 0
default	16:46:46.013734-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	16:46:46.077805-0500	RedLemon	0x7f7b9ccacba8 ID=368 Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> received response, status 200 content K
default	16:46:46.079349-0500	RedLemon	Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> response ended
default	16:46:46.079765-0500	RedLemon	Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> done using Connection 3
default	16:46:46.080113-0500	RedLemon	Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> summary for task success {transaction_duration_ms=88, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=86, response_duration_ms=2, request_bytes=530, response_bytes=662, cache_hit=false}
default	16:46:46.080319-0500	RedLemon	Task <C0E06E8C-1CAA-4A4D-9973-2C17919F4B48>.<141> finished successfully
default	16:46:46.083261-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2608 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:46.083437-0500	runningboardd	Assertion 166-10341-2608 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:46.084830-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:46.084870-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:46.085020-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:46.089245-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2609 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:46.089413-0500	runningboardd	Assertion 166-103-2609 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:46.090291-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:46.090332-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:46.090373-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:47.152157-0500	runningboardd	Invalidating assertion 166-10341-2608 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:47.272794-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:47.272870-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:47.273096-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:47.275243-0500	runningboardd	Invalidating assertion 166-103-2609 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:47.432637-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:47.432900-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:47.433033-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:47.990549-0500	RedLemon	Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:47.991153-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C885CB54-2F9D-476B-A870-E29325D8D4F9] (reporting strategy default)> on Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> was not selected for reporting
default	16:46:47.992271-0500	RedLemon	Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:47.992582-0500	RedLemon	Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> now using Connection 3
default	16:46:47.995244-0500	RedLemon	0x7f7b9c860f08 ID=372 Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> sent request, body N 0
default	16:46:48.059879-0500	RedLemon	0x7f7b9c860f08 ID=372 Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> received response, status 200 content K
default	16:46:48.060298-0500	RedLemon	Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> response ended
default	16:46:48.060544-0500	RedLemon	Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> done using Connection 3
default	16:46:48.060754-0500	RedLemon	Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=68, response_duration_ms=0, request_bytes=530, response_bytes=662, cache_hit=true}
default	16:46:48.061121-0500	RedLemon	Task <D4806AF3-EDFC-4E92-804F-8D0B92D9A14D>.<142> finished successfully
default	16:46:48.061906-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2610 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:48.062076-0500	runningboardd	Assertion 166-10341-2610 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:48.062941-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:48.063191-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:48.063245-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:48.065526-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2611 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:48.065671-0500	runningboardd	Assertion 166-103-2611 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:48.066807-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:48.066850-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:48.066890-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:49.158751-0500	runningboardd	Invalidating assertion 166-10341-2610 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:49.275985-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:49.276030-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:49.276074-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:49.277564-0500	runningboardd	Invalidating assertion 166-103-2611 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:49.433433-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:49.433501-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:49.433549-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:49.990628-0500	RedLemon	Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:49.991190-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [026E27ED-C3B2-4001-A140-A4230970EF45] (reporting strategy default)> on Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> was not selected for reporting
default	16:46:49.992291-0500	RedLemon	Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:49.992614-0500	RedLemon	Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> now using Connection 3
default	16:46:49.994724-0500	RedLemon	0x7f7b9ccacba8 ID=376 Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> sent request, body N 0
default	16:46:50.061431-0500	RedLemon	0x7f7b9ccacba8 ID=376 Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> received response, status 200 content K
default	16:46:50.062104-0500	RedLemon	Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> response ended
default	16:46:50.067533-0500	RedLemon	Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> done using Connection 3
default	16:46:50.068470-0500	RedLemon	Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> summary for task success {transaction_duration_ms=76, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=69, response_duration_ms=7, request_bytes=530, response_bytes=661, cache_hit=true}
default	16:46:50.068999-0500	RedLemon	Task <BB38CEA5-0F19-4333-9513-5D431FBDAB4E>.<143> finished successfully
default	16:46:50.069802-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2612 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:50.069947-0500	runningboardd	Assertion 166-10341-2612 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:50.070602-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:50.070645-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:50.070847-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:50.073148-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2613 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:50.073391-0500	runningboardd	Assertion 166-103-2613 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:50.074471-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:50.074511-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:50.074551-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:51.119966-0500	runningboardd	Invalidating assertion 166-10341-2612 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:51.273978-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:51.274122-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:51.274256-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:51.276386-0500	runningboardd	Invalidating assertion 166-103-2613 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:51.444927-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:51.444973-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:51.445019-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:51.990067-0500	RedLemon	Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:51.990653-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2B4867F0-A061-48A4-B38C-E5738F8C61CF] (reporting strategy default)> on Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> was not selected for reporting
default	16:46:51.991889-0500	RedLemon	Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:51.992228-0500	RedLemon	Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> now using Connection 3
default	16:46:51.994335-0500	RedLemon	0x7f7b9c860f08 ID=380 Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> sent request, body N 0
default	16:46:52.010366-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	16:46:52.062341-0500	RedLemon	0x7f7b9c860f08 ID=380 Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> received response, status 200 content K
default	16:46:52.062880-0500	RedLemon	Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> response ended
default	16:46:52.063275-0500	RedLemon	Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> done using Connection 3
default	16:46:52.063456-0500	RedLemon	Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=70, response_duration_ms=1, request_bytes=530, response_bytes=658, cache_hit=true}
default	16:46:52.063652-0500	RedLemon	Task <25BCCA4B-078A-451B-AA1E-8138D27078F0>.<144> finished successfully
default	16:46:52.064280-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2614 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:52.064443-0500	runningboardd	Assertion 166-10341-2614 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:52.065208-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:52.065262-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:52.065309-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:52.067467-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2615 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:52.067609-0500	runningboardd	Assertion 166-103-2615 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:52.068384-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:52.068463-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:52.068510-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:53.166529-0500	runningboardd	Invalidating assertion 166-10341-2614 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:53.322926-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:53.322972-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:53.323015-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:53.325021-0500	runningboardd	Invalidating assertion 166-103-2615 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:53.435208-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:53.435291-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:53.435350-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:53.990669-0500	RedLemon	Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:46:53.991178-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C81C86A7-F0ED-43B2-AB4E-BBC32168BA11] (reporting strategy default)> on Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> was not selected for reporting
default	16:46:53.992151-0500	RedLemon	Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:53.992506-0500	RedLemon	Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> now using Connection 3
default	16:46:53.994779-0500	RedLemon	0x7f7b9ccacba8 ID=384 Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> sent request, body N 0
default	16:46:54.069562-0500	RedLemon	0x7f7b9ccacba8 ID=384 Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> received response, status 200 content K
default	16:46:54.070326-0500	RedLemon	Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> response ended
default	16:46:54.070734-0500	RedLemon	Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> done using Connection 3
default	16:46:54.070910-0500	RedLemon	Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> summary for task success {transaction_duration_ms=79, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=77, response_duration_ms=1, request_bytes=530, response_bytes=662, cache_hit=false}
default	16:46:54.071113-0500	RedLemon	Task <971490E7-B336-41D1-BC36-4DF5D66A3C39>.<145> finished successfully
default	16:46:54.072197-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2616 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:54.072452-0500	runningboardd	Assertion 166-10341-2616 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:54.073432-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:54.073476-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:54.073514-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:54.075207-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2617 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:54.075382-0500	runningboardd	Assertion 166-103-2617 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:54.076462-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:54.076512-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:54.076586-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:55.166616-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:46:55.168559-0500	runningboardd	Invalidating assertion 166-10341-2616 (target:[anon<RedLemon>(501):10341]) from originator [anon<RedLemon>(501):10341]
default	16:46:55.167989-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EDB57434-D87A-461B-AD04-2B999FD7FA83] (reporting strategy default)> on Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> was not selected for reporting
default	16:46:55.168678-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:46:55.169164-0500	RedLemon	Connection 33: enabling TLS
default	16:46:55.169199-0500	RedLemon	Connection 33: starting, TC(0x0)
default	16:46:55.169248-0500	RedLemon	[C33 E882F4BA-78D0-431B-BB6B-EFBAF5B7E3A4 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{7A8B7429-A599-4624-A41E-89D78FF165D9}{(null)}{Y}{2} (private), proc: BB0FCE06-4B0C-3558-8755-F0C703DBAE94] start
default	16:46:55.169325-0500	RedLemon	[C33 Hostname#6d693a93:443 initial path ((null))] event: path:start @0.000s
default	16:46:55.169626-0500	RedLemon	[C33 Hostname#6d693a93:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 555E5028-12D8-4698-A0D6-877D925B880E
default	16:46:55.169797-0500	RedLemon	[C33 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:46:55.169835-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state preparing
default	16:46:55.170027-0500	mDNSResponder	[R3328] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 10341 (RedLemon)
default	16:46:55.169989-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> setting up Connection 33
default	16:46:55.171150-0500	mDNSResponder	[R3328] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 10341 (RedLemon)
default	16:46:55.171320-0500	RedLemon	nw_endpoint_resolver_update [C33 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7a3df01a:443
default	16:46:55.171477-0500	RedLemon	[C33 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	16:46:55.171689-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 initial path ((null))] event: path:start @0.002s
default	16:46:55.172005-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: 38FBDB8D-7AD7-4556-BBEC-E2A43BA5C4FE
default	16:46:55.172097-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.002s
default	16:46:55.172498-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.003s
default	16:46:55.173000-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.003s
default	16:46:55.173156-0500	RedLemon	tcp_output [C33.1:3] flags=[S] seq=1731127344, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1731127344
default	16:46:55.325278-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:55.325361-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:55.325438-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:55.327754-0500	runningboardd	Invalidating assertion 166-103-2617 (target:[anon<RedLemon>(501):10341]) from originator [daemon<com.apple.powerd>:103]
default	16:46:55.346398-0500	RedLemon	tcp_input [C33.1:3] flags=[S.] seq=4064870600, ack=1731127345, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=1731127344
default	16:46:55.346615-0500	RedLemon	nw_flow_connected [C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:55.346954-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.177s
default	16:46:55.347049-0500	RedLemon	[C33 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.177s
default	16:46:55.347584-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C33.1:2][0x7f7b9a3d5000] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:46:55.347822-0500	RedLemon	boringssl_context_info_handler(2028) [C33.1:2][0x7f7b9a3d5000] Client handshake started
default	16:46:55.348129-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS client enter_early_data
default	16:46:55.348335-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS client read_server_hello
default	16:46:55.446616-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:55.446685-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:55.446732-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:55.473057-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:46:55.473193-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client read_server_hello
default	16:46:55.473864-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:46:55.476412-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client read_certificate_request
default	16:46:55.477057-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client read_server_certificate
default	16:46:55.477122-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:46:55.477895-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C33.1:2][0x7f7b9a3d5000] Performing external trust evaluation
default	16:46:55.478183-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C33.1:2][0x7f7b9a3d5000] Asyncing for external verify block
default	16:46:55.478372-0500	RedLemon	Connection 33: asked to evaluate TLS Trust
default	16:46:55.478677-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> auth completion disp=1 cred=0x0
default	16:46:55.483845-0500	RedLemon	Connection 33: TLS Trust result 0
default	16:46:55.483897-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C33.1:2][0x7f7b9a3d5000] Returning from external verify block with result: true
default	16:46:55.484004-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C33.1:2][0x7f7b9a3d5000] Certificate verification result: OK
default	16:46:55.484374-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client read_server_finished
default	16:46:55.484553-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:46:55.484587-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:46:55.484618-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client send_client_certificate
default	16:46:55.484663-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client complete_second_flight
default	16:46:55.484776-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS 1.3 client done
default	16:46:55.484929-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS client finish_client_handshake
default	16:46:55.484968-0500	RedLemon	boringssl_context_info_handler(2045) [C33.1:2][0x7f7b9a3d5000] Client handshake state: TLS client done
default	16:46:55.485002-0500	RedLemon	boringssl_context_info_handler(2034) [C33.1:2][0x7f7b9a3d5000] Client handshake done
default	16:46:55.485495-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C33.1:2][0x7f7b9a3d5000] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(138ms) flight_time(127ms) rtt(124ms) write_stalls(0) read_stalls(6)]
default	16:46:55.485639-0500	RedLemon	nw_flow_connected [C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:55.485887-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.316s
default	16:46:55.486200-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state ready
default	16:46:55.486284-0500	RedLemon	[C33 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.316s
default	16:46:55.486401-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.317s
default	16:46:55.486454-0500	RedLemon	[C33 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.317s
default	16:46:55.486747-0500	RedLemon	Connection 33: connected successfully
default	16:46:55.486789-0500	RedLemon	Connection 33: TLS handshake complete
default	16:46:55.487003-0500	RedLemon	Connection 33: ready C(N) E(N)
default	16:46:55.487152-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> now using Connection 33
default	16:46:55.487234-0500	RedLemon	Connection 33: received viability advisory(Y)
default	16:46:55.487413-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> sent request, body N 0
default	16:46:55.651928-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> received response, status 101 content U
default	16:46:55.652209-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> response ended
default	16:46:55.652318-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> done using Connection 33
default	16:46:55.653166-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.483s
default	16:46:55.653232-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state preparing
default	16:46:55.653332-0500	RedLemon	[C33 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.483s
default	16:46:55.653548-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.484s
default	16:46:55.653634-0500	RedLemon	[C33 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.484s
default	16:46:55.653774-0500	RedLemon	nw_flow_connected [C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:46:55.653965-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.484s
default	16:46:55.654053-0500	RedLemon	[C33 Hostname#6d693a93:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.484s
default	16:46:55.655042-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [anon<RedLemon>(501):10341] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-10341-2618 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:55.654503-0500	RedLemon	nw_flow_connected [C33.1 IPv4#7a3df01a:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-819796861)
default	16:46:55.655303-0500	runningboardd	Assertion 166-10341-2618 (target:[anon<RedLemon>(501):10341]) will be created as active as no start-time-defining assertions exist
default	16:46:55.654962-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.485s
default	16:46:55.655011-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state ready
default	16:46:55.655114-0500	RedLemon	[C33 Hostname#6d693a93:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.485s
default	16:46:55.656568-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:55.656614-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:55.656656-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:55.662080-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):10341] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-2619 target:10341 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:46:55.662234-0500	runningboardd	Assertion 166-103-2619 (target:[anon<RedLemon>(501):10341]) will be created as active
default	16:46:55.662940-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring jetsam update because this process is not memory-managed
default	16:46:55.662986-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring suspend because this process is not lifecycle managed
default	16:46:55.663028-0500	runningboardd	[anon<RedLemon>(501):10341] Ignoring GPU update because this process is not GPU managed
default	16:46:55.856316-0500	RedLemon	tcp_input [C33.1:3] flags=[F.] seq=4064873632, ack=1731128399, win=249 state=ESTABLISHED rcv_nxt=4064873632, snd_una=1731128399
default	16:46:55.856396-0500	RedLemon	nw_protocol_tcp_log_summary [C33.1:3] 
	[267166C6-5A3A-4F9A-A951-745682E9B603 <private>:57958<-><private>:443]
	Init: 1, Conn_Time: 173.414ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 156.000ms, rtt_var: 31.625ms rtt_nc: 171.062ms, rtt_var_nc: 52.125ms base rtt: 124ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:46:55.857021-0500	RedLemon	nw_flow_disconnected [C33.1 IPv4#7a3df01a:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	16:46:55.857595-0500	RedLemon	Connection 33: read-side closed
default	16:46:55.857636-0500	RedLemon	Connection 33: read-side closed
default	16:46:55.857667-0500	RedLemon	Connection 33: read-side closed
default	16:46:55.858023-0500	RedLemon	[C33.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.688s, error Socket is not connected
default	16:46:55.858048-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state failed error Socket is not connected
default	16:46:55.858082-0500	RedLemon	[C33 Hostname#6d693a93:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.688s
error	16:46:55.858156-0500	RedLemon	nw_read_request_report [C33] Receive failed with error "Socket is not connected"
error	16:46:55.858226-0500	RedLemon	nw_flow_service_reads [C33.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	16:46:55.858315-0500	RedLemon	tcp_output [C33.1:3] flags=[F.] seq=1731128530, ack=4064873633, win=2048 state=LAST_ACK rcv_nxt=4064873633, snd_una=1731128399
error	16:46:55.858431-0500	RedLemon	Connection 33: received failure notification
default	16:46:55.858561-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> summary for task success {transaction_duration_ms=690, response_status=101, connection=33, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=313, secure_connection_duration_ms=138, private_relay=false, request_start_ms=318, request_duration_ms=0, response_start_ms=483, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	16:46:55.858597-0500	RedLemon	nw_flow_add_write_request [C33.1 IPv4#7a3df01a:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	16:46:55.858654-0500	RedLemon	nw_write_request_report [C33] Send failed with error "Socket is not connected"
default	16:46:55.858704-0500	RedLemon	Task <0FB8BF4B-1E0E-4B37-9D88-B34886A9A933>.<1> finished successfully
default	16:46:55.858721-0500	RedLemon	Connection 33: cleaning up
default	16:46:55.858865-0500	RedLemon	[C33 E882F4BA-78D0-431B-BB6B-EFBAF5B7E3A4 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancel
default	16:46:55.859072-0500	RedLemon	[C33 E882F4BA-78D0-431B-BB6B-EFBAF5B7E3A4 Hostname#6d693a93:443 tcp, url hash: 87e1f5ca, tls, definite, attribution: developer] cancelled
	[C33.1 38FBDB8D-7AD7-4556-BBEC-E2A43BA5C4FE 10.0.0.113:57958<->IPv4#7a3df01a:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.689s, DNS @0.000s took 0.002s, TCP @0.484s took 0.174s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:46:55.859532-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state cancelled error Socket is not connected
default	16:46:55.859632-0500	RedLemon	Connection 33: done



