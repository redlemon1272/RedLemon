default	10:02:43.057514-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):31623] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "frontmost:31623" ID:170-129-2657 target:31623 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	10:02:43.057693-0500	runningboardd	Assertion 170-129-2657 (target:[anon<RedLemon>(501):31623]) will be created as active
default	10:02:43.076044-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:02:43.080353-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:02:43.081800-0500	runningboardd	[anon<RedLemon>(501):31623] Set darwin role to: UserInteractiveFocal
default	10:02:43.081864-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed
default	10:02:43.082493-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):31623] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "notification:31623" ID:170-129-2658 target:31623 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	10:02:43.083000-0500	runningboardd	Assertion 170-129-2658 (target:[anon<RedLemon>(501):31623]) will be created as active
default	10:02:43.084323-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:02:43.084579-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:02:43.084956-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed
default	10:02:44.439590-0500	RedLemon	tcp_input [C3.1:3] flags=[F.] seq=2586725134, ack=4239747803, win=8 state=ESTABLISHED rcv_nxt=2586725134, snd_una=4239747803
default	10:02:44.439660-0500	RedLemon	nw_protocol_tcp_log_summary [C3.1:3] 
	[26B9D4E6-EC9E-409D-B203-75A6109A666E <private>:50764<-><private>:443]
	Init: 1, Conn_Time: 15.698ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 6, rtt: 21.156ms, rtt_var: 6.125ms rtt_nc: 18.468ms, rtt_var_nc: 6.687ms base rtt: 10ms
	ACKs-compressed: 0, ACKs delayed: 12 delayed ACKs sent: 0
default	10:02:44.440121-0500	RedLemon	Connection 3: read-side closed
default	10:02:44.440151-0500	RedLemon	Connection 3: read-side closed
default	10:02:44.440180-0500	RedLemon	Connection 3: read-side closed
default	10:02:44.440449-0500	RedLemon	Connection 3: cleaning up
default	10:02:44.440519-0500	RedLemon	[C3 C4341DF1-2A56-4AEB-9719-B61A3C8EE3D0 Hostname#763f68f1:443 tcp, url hash: a61f3466, tls, definite, attribution: developer] cancel
default	10:02:44.440634-0500	RedLemon	[C3 C4341DF1-2A56-4AEB-9719-B61A3C8EE3D0 Hostname#763f68f1:443 tcp, url hash: a61f3466, tls, definite, attribution: developer] cancelled
	[C3.1 DB300088-0DF1-4123-88CC-EE41363D6E6C 2607:fea8:995b:fd00:69c2:ff9c:f4aa:9b7a.50764<->IPv6#6d69b338.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 22.028s, DNS @0.000s took 0.053s, TCP @0.054s took 0.016s, TLS 1.3 took 0.027s
	bytes in/out: 469814/1166, packets in/out: 78/95, rtt: 0.021s, retransmitted bytes: 0, out-of-order bytes: 45696
default	10:02:44.441111-0500	RedLemon	nw_flow_disconnected [C3.1 IPv6#6d69b338.443 cancelled channel-flow ((null))] Output protocol disconnected
default	10:02:44.441258-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C3] reporting state cancelled
default	10:02:44.444645-0500	RedLemon	tcp_output [C3.1:3] flags=[F.] seq=4239747866, ack=2586725135, win=15658 state=LAST_ACK rcv_nxt=2586725135, snd_una=4239747803
error	10:02:44.463601-0500	RedLemon	tcp_input [C3.1:3] flags=[R.] seq=2586725135, ack=4239747866, win=8 state=LAST_ACK rcv_nxt=2586725135, snd_una=4239747803
error	10:02:44.463695-0500	RedLemon	tcp_input [C3.1:3] flags=[R] seq=2586725135, ack=0, win=0 state=CLOSED rcv_nxt=2586725135, snd_una=4239747803
default	10:02:44.788994-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:02:44.790148-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [03FAACBB-B0FE-457C-B06C-60578634FE1C] (reporting strategy default)> on Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> was not selected for reporting
default	10:02:44.790775-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:44.791078-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> now using Connection 1
default	10:02:44.791985-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> sent request, body N 0
default	10:02:44.985152-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> received response, status 200 content U
default	10:02:44.987206-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> done using Connection 1
default	10:02:44.987302-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> response ended
default	10:02:44.987422-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> summary for task success {transaction_duration_ms=196, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=194, response_duration_ms=2, request_bytes=269, response_bytes=9003, cache_hit=false}
default	10:02:44.987617-0500	RedLemon	Task <D069F89E-5D62-4147-829D-B4E1F1D441B9>.<24> finished successfully
default	10:02:44.995487-0500	RedLemon	✅ [ScheduleManagement] Refreshed data. Loaded 55 movies. Version: 60
default	10:02:48.280404-0500	runningboardd	Assertion did invalidate due to timeout: 170-129-2658 (target:[anon<RedLemon>(501):31623])
default	10:02:48.322865-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	10:02:48.323254-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E6EBECB9-B40F-4579-B38E-585B914980FF] (reporting strategy default)> on Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> was not selected for reporting
default	10:02:48.323879-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:48.324100-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> now using Connection 1
default	10:02:48.324362-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> sent request, body N 0
default	10:02:48.389678-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> received response, status 200 content U
default	10:02:48.391016-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:02:48.391057-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:02:48.392183-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> done using Connection 1
default	10:02:48.391098-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed
default	10:02:48.394859-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> response ended
default	10:02:48.395013-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> summary for task success {transaction_duration_ms=71, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=65, response_duration_ms=5, request_bytes=269, response_bytes=9210, cache_hit=false}
default	10:02:48.395221-0500	RedLemon	Task <B7AB2FFB-A7EC-4356-9A19-E364DA38503D>.<25> finished successfully
default	10:02:48.402409-0500	RedLemon	📝 [Admin] Current exclusions: 23
default	10:02:48.402530-0500	RedLemon	➕ [Admin] Added to exclusions: tt12300742
default	10:02:48.402617-0500	RedLemon	📤 [Admin] Uploading config with 24 exclusions
default	10:02:48.402911-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	10:02:48.403256-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [762E2BF6-DFF1-403E-915C-48D7F0AAA68F] (reporting strategy default)> on Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> was not selected for reporting
default	10:02:48.403758-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:48.403896-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> now using Connection 1
default	10:02:48.404052-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> sent request, body N 0
default	10:02:48.745673-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> received response, status 200 content U
default	10:02:48.746676-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> done using Connection 1
default	10:02:48.747277-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> response ended
default	10:02:48.747353-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> summary for task success {transaction_duration_ms=343, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=342, response_duration_ms=1, request_bytes=269, response_bytes=8973, cache_hit=false}
default	10:02:48.747546-0500	RedLemon	Task <A997190A-6FFF-47DF-A338-2C172F4DF650>.<26> finished successfully
default	10:02:48.765660-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	10:02:48.766123-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B5CD53B7-1B87-4CEB-83FA-61CF1C8E76DF] (reporting strategy default)> on Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> was not selected for reporting
default	10:02:48.766838-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:48.767110-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> now using Connection 1
default	10:02:48.768832-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> sent request, body S 31861
default	10:02:49.279474-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> received response, status 201 content U
default	10:02:49.280819-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> done using Connection 1
default	10:02:49.280895-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> response ended
default	10:02:49.280991-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> summary for task success {transaction_duration_ms=514, response_status=201, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=511, response_duration_ms=3, request_bytes=32096, response_bytes=8880, cache_hit=false}
default	10:02:49.281203-0500	RedLemon	Task <AB7873E3-98E3-4242-B9A7-FFE48A62A393>.<27> finished successfully
default	10:02:50.005511-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:50.005878-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5E82573C-86AF-4032-8C40-E836A4D0DC53] (reporting strategy default)> on Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> was not selected for reporting
default	10:02:50.007107-0500	RedLemon	Connection 8: starting, TC(0x0)
default	10:02:50.007226-0500	RedLemon	[C8 7E272EA1-23B5-4254-B2CC-085FF3735D9B 127.0.0.1:47253 tcp, url hash: cc59afb5, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{5FCC8BB4-36C1-4E68-A112-F5A7A4F351C6}{(null)}{Y}{2} (private), proc: 3970653B-7437-3725-8CBA-C148B6D75E00] start
default	10:02:50.007322-0500	RedLemon	[C8 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:02:50.007616-0500	RedLemon	[C8 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: A6248687-65B5-4B61-B484-2F593386664B
default	10:02:50.008563-0500	RedLemon	[C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.001s
default	10:02:50.008606-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C8] reporting state preparing
default	10:02:50.008939-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> setting up Connection 8
default	10:02:50.009565-0500	RedLemon	nw_socket_handle_socket_event [C8:2] Socket received CONNECTED event
default	10:02:50.009744-0500	RedLemon	nw_flow_connected [C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:02:50.009792-0500	RedLemon	[C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.002s
default	10:02:50.009989-0500	RedLemon	nw_flow_connected [C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1378573142)
default	10:02:50.010159-0500	RedLemon	[C8 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	10:02:50.010565-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C8] reporting state ready
default	10:02:50.010621-0500	RedLemon	[C8 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.003s
default	10:02:50.010807-0500	RedLemon	Connection 8: connected successfully
default	10:02:50.010895-0500	RedLemon	Connection 8: ready C(N) E(N)
default	10:02:50.011221-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> now using Connection 8
default	10:02:50.011353-0500	RedLemon	Connection 8: received viability advisory(Y)
default	10:02:50.011694-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> sent request, body N 0
default	10:02:50.041688-0500	mDNSResponder	[R4038] DNSServiceCreateConnection START PID[31623](RedLemon)
default	10:02:50.041841-0500	mDNSResponder	[R4039] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, Addr) START PID[31623](RedLemon)
default	10:02:50.042785-0500	mDNSResponder	[R4040] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, AAAA) START PID[31623](RedLemon)
default	10:02:50.043513-0500	mDNSResponder	[R4039] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, Addr) STOP PID[31623](RedLemon)
default	10:02:50.043632-0500	mDNSResponder	[R4040] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, AAAA) STOP PID[31623](RedLemon)
default	10:02:50.313262-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> received response, status 200 content K
default	10:02:50.313973-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> response ended
default	10:02:50.314129-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> done using Connection 8
default	10:02:50.314344-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> summary for task success {transaction_duration_ms=308, response_status=200, connection=8, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=1, secure_connection_duration_ms=0, private_relay=false, request_start_ms=5, request_duration_ms=0, response_start_ms=306, response_duration_ms=1, request_bytes=252, response_bytes=236809, cache_hit=false}
default	10:02:50.314640-0500	RedLemon	Task <CD897F89-979A-4685-90B9-AAAC9C748456>.<1> finished successfully
default	10:02:50.542280-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:50.543569-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8567B65F-D7E4-46A9-BDF8-BEDC1F23DF68] (reporting strategy default)> on Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> was not selected for reporting
default	10:02:50.548321-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> now using Connection 8
default	10:02:50.572271-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> sent request, body N 0
default	10:02:50.628046-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> received response, status 200 content K
default	10:02:50.628478-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> response ended
default	10:02:50.628540-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> done using Connection 8
default	10:02:50.628631-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> summary for task success {transaction_duration_ms=83, response_status=200, connection=8, reused=1, request_start_ms=26, request_duration_ms=0, response_start_ms=82, response_duration_ms=0, request_bytes=254, response_bytes=236809, cache_hit=false}
default	10:02:50.628952-0500	RedLemon	Task <089B27A5-C09E-4009-B2C4-9BB519263FD6>.<2> finished successfully
default	10:02:50.841455-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:50.841887-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FB6EB789-5F92-4A06-844A-480BC7FC9F79] (reporting strategy default)> on Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> was not selected for reporting
default	10:02:50.842576-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> now using Connection 8
default	10:02:50.842943-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> sent request, body N 0
default	10:02:50.878057-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> received response, status 200 content K
default	10:02:50.878420-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> response ended
default	10:02:50.878483-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> done using Connection 8
default	10:02:50.878684-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> summary for task success {transaction_duration_ms=36, response_status=200, connection=8, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=35, response_duration_ms=0, request_bytes=254, response_bytes=236809, cache_hit=false}
default	10:02:50.878882-0500	RedLemon	Task <FC9BFD2D-260A-49C4-9D6D-8B6E3D04D366>.<3> finished successfully
default	10:02:51.109544-0500	RedLemon	📝 [Admin] Fetching current config to retrieve exclusions...
default	10:02:51.113440-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:02:51.113765-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A1D7ECD4-8C58-4509-8FE6-CC0A750591FF] (reporting strategy default)> on Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> was not selected for reporting
default	10:02:51.114312-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:51.114521-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> now using Connection 1
default	10:02:51.114757-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> sent request, body N 0
default	10:02:51.191385-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> received response, status 200 content U
default	10:02:51.191668-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> done using Connection 1
default	10:02:51.192836-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> response ended
default	10:02:51.193001-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> summary for task success {transaction_duration_ms=78, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=77, response_duration_ms=1, request_bytes=269, response_bytes=8822, cache_hit=false}
default	10:02:51.193578-0500	RedLemon	Task <876F1DD4-89DC-4481-9DCA-10A79345F168>.<28> finished successfully
default	10:02:51.202856-0500	RedLemon	📝 [Admin] Found 24 previously excluded movies
default	10:02:51.203372-0500	RedLemon	📝 [Admin] Exclusions list: ["tt29567915", "tt0468569", "tt1302067", "tt14205554", "tt29615160", "tt6604188", "tt7349950", "tt26920256", "tt23050520", "tt12300742", "tt16431870", "tt28293853", "tt9603208", "tt29468874", "tt14999684", "tt13186306", "tt31434030", "tt1527793", "tt2803854", "tt10676052", "tt1312221", "tt32565484", "tt32123395", "tt31036941"]
default	10:02:51.203474-0500	RedLemon	📝 [Admin] Exclusions: tt29567915, tt0468569, tt1302067, tt14205554, tt29615160, tt6604188, tt7349950, tt26920256, tt23050520, tt12300742, tt16431870, tt28293853, tt9603208, tt29468874, tt14999684, tt13186306, tt31434030, tt1527793, tt2803854, tt10676052, tt1312221, tt32565484, tt32123395, tt31036941
default	10:02:51.204236-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Altered (ID: tt32123395)
default	10:02:51.204400-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Dracula (ID: tt31434030)
default	10:02:51.204416-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Tron: Ares (ID: tt6604188)
default	10:02:51.204390-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Border Hunters (ID: tt32565484)
default	10:02:51.204559-0500	RedLemon	🚫 [Admin] Skipping excluded movie: War of the Worlds (ID: tt13186306)
default	10:02:51.204632-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Frankenstein (ID: tt1312221)
default	10:02:51.204618-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.204716-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Bugonia (ID: tt12300742)
default	10:02:51.204812-0500	RedLemon	🚫 [Admin] Skipping excluded movie: KPop Demon Hunters (ID: tt14205554)
default	10:02:51.204870-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Beast of War (ID: tt29468874)
default	10:02:51.204967-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Skinford: Death Sentence (ID: tt23050520)
default	10:02:51.205539-0500	RedLemon	🚫 [Admin] Skipping excluded movie: First Moon (ID: tt26920256)
default	10:02:51.205516-0500	RedLemon	🚫 [Admin] Skipping excluded movie: The Fantastic Four: First Steps (ID: tt10676052)
default	10:02:51.205575-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Shelby Oaks (ID: tt14999684)
default	10:02:51.205804-0500	RedLemon	🚫 [Admin] Skipping excluded movie: The Storm (ID: tt29615160)
default	10:02:51.205754-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Mission: Impossible - The Final Reckoning (ID: tt9603208)
default	10:02:51.206017-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Jurassic World: Rebirth (ID: tt31036941)
default	10:02:51.206114-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Yogi Bear (ID: tt1302067)
default	10:02:51.206176-0500	RedLemon	🚫 [Admin] Skipping excluded movie: The Family Plan (ID: tt16431870)
default	10:02:51.206309-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Nuremberg (ID: tt29567915)
default	10:02:51.206331-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Spider Man: Lost Cause (ID: tt2803854)
default	10:02:51.206367-0500	RedLemon	🚫 [Admin] Skipping excluded movie: The Dark Knight (ID: tt0468569)
default	10:02:51.206435-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C437C897-11EE-44BC-8D20-58BB3A93098E] (reporting strategy default)> on Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> was not selected for reporting
default	10:02:51.206639-0500	RedLemon	🚫 [Admin] Skipping excluded movie: It: Chapter Two (ID: tt7349950)
default	10:02:51.206665-0500	RedLemon	🚫 [Admin] Skipping excluded movie: No Other Choice (ID: tt1527793)
default	10:02:51.206491-0500	RedLemon	🚫 [Admin] Skipping excluded movie: Hunting Grounds (ID: tt28293853)
default	10:02:51.206955-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.206979-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.206979-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.207073-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.207828-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> now using Connection 8
default	10:02:51.208596-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E537118F-C6CD-4486-A07C-333A1C0B8058] (reporting strategy default)> on Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> was not selected for reporting
default	10:02:51.208909-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6EA9215D-4209-45C1-B698-158B710D11B1] (reporting strategy default)> on Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> was not selected for reporting
default	10:02:51.209033-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5E46292C-3E9C-4E2A-B3D4-0720BA2BD8C0] (reporting strategy default)> on Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> was not selected for reporting
default	10:02:51.209069-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.209427-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.209424-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.209773-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AED20276-C67E-42A8-AC60-5B0E9AA79D24] (reporting strategy default)> on Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> was not selected for reporting
default	10:02:51.210603-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.211429-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A91924BB-56FD-4AB7-AC18-03D902347574] (reporting strategy default)> on Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> was not selected for reporting
default	10:02:51.211741-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B8C0AE4A-7423-4684-9EDE-A1116FDF5E21] (reporting strategy default)> on Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> was not selected for reporting
default	10:02:51.211720-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [49BA8044-7768-40D8-8460-F6F5453522ED] (reporting strategy default)> on Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> was not selected for reporting
default	10:02:51.211968-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.212337-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.212449-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.212981-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FEA7A4AA-1E36-4063-89E4-7643058039C9] (reporting strategy default)> on Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> was not selected for reporting
default	10:02:51.213816-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.214873-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [03226E2C-60C3-4BF6-9924-1259A6959203] (reporting strategy default)> on Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> was not selected for reporting
default	10:02:51.214921-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DF2FB2A0-CC72-45F3-888C-19A3645D943E] (reporting strategy default)> on Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> was not selected for reporting
default	10:02:51.214961-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [77F3F0B8-FF4A-4B4A-83B8-7D65727AD3B6] (reporting strategy default)> on Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> was not selected for reporting
default	10:02:51.215332-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.215492-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.215600-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.216253-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [20F883A3-53FF-4B41-A25E-7FC895880306] (reporting strategy default)> on Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> was not selected for reporting
default	10:02:51.216818-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.217962-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [17D680A8-563B-4C2F-8688-9544FBF84CAA] (reporting strategy default)> on Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> was not selected for reporting
default	10:02:51.218089-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [52831CC7-B0E3-4FA0-B778-0EAE382EED75] (reporting strategy default)> on Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> was not selected for reporting
default	10:02:51.218523-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.218521-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D50CB596-A220-4BF5-8B34-C083B9F1F568] (reporting strategy default)> on Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> was not selected for reporting
default	10:02:51.218844-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.219120-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.219682-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7E9AD4F9-772D-445C-8ABE-A5BB3055B672] (reporting strategy default)> on Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> was not selected for reporting
default	10:02:51.220216-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.220813-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4EA7C7CB-65A0-4DBF-A47E-6A417E637D5B] (reporting strategy default)> on Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> was not selected for reporting
default	10:02:51.221328-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0B3BAF2C-6C02-457B-B71E-9C92C850AAE2] (reporting strategy default)> on Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> was not selected for reporting
default	10:02:51.221832-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.221802-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.222394-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6A25AD13-8153-4E2C-B3CE-227219A822ED] (reporting strategy default)> on Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> was not selected for reporting
default	10:02:51.222115-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6E550211-8169-4D20-9F92-51A70ED45064] (reporting strategy default)> on Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> was not selected for reporting
default	10:02:51.222840-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.223140-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.224050-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [66FEB325-8934-447E-B914-BFA60C81B87A] (reporting strategy default)> on Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> was not selected for reporting
default	10:02:51.224409-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [312931CC-26C4-4F34-98C8-4312751DD9D2] (reporting strategy default)> on Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> was not selected for reporting
default	10:02:51.224636-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.225347-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.226782-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [456968FD-E561-4F22-857A-D16FF10A4959] (reporting strategy default)> on Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> was not selected for reporting
default	10:02:51.226592-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [905FE0B6-F3E6-4DA1-B024-C163DCE055DF] (reporting strategy default)> on Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> was not selected for reporting
default	10:02:51.227296-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.227291-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.227366-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9BAFABDE-3EA0-45F5-A01C-4777982D7355] (reporting strategy default)> on Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> was not selected for reporting
default	10:02:51.227355-0500	RedLemon	Connection 9: starting, TC(0x0)
default	10:02:51.227853-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.227787-0500	RedLemon	[C9 BF783A30-8E01-4215-A69D-3D61483341A3 127.0.0.1:47253 tcp, url hash: e62669cc, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{5FCC8BB4-36C1-4E68-A112-F5A7A4F351C6}{(null)}{Y}{2} (private), proc: 3970653B-7437-3725-8CBA-C148B6D75E00] start
default	10:02:51.227890-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6CB5DE53-91FB-4D67-86B0-7593332E55CF] (reporting strategy default)> on Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> was not selected for reporting
default	10:02:51.228390-0500	RedLemon	[C9 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:02:51.228986-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.229136-0500	RedLemon	[C9 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: A6248687-65B5-4B61-B484-2F593386664B
default	10:02:51.230135-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9B9508C1-B378-4B0B-9792-A8749610800E] (reporting strategy default)> on Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> was not selected for reporting
default	10:02:51.230618-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FC861007-2612-4EAF-B6A0-6608A8183ED1] (reporting strategy default)> on Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> was not selected for reporting
default	10:02:51.230246-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [48425541-0131-4895-BEA0-8DCD3A4C8CC9] (reporting strategy default)> on Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> was not selected for reporting
default	10:02:51.230793-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.231070-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5C52F995-40AD-468D-9816-CE5F719115B2] (reporting strategy default)> on Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> was not selected for reporting
default	10:02:51.231297-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.231096-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.231625-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.232903-0500	RedLemon	[C9 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.004s
default	10:02:51.233380-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C9] reporting state preparing
default	10:02:51.233792-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0462D93B-15CB-46BA-8392-EBD649718BDB] (reporting strategy default)> on Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> was not selected for reporting
default	10:02:51.233961-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> setting up Connection 9
default	10:02:51.234319-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.234452-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FA0213DD-C4A1-4144-8FFA-A605FEF8A290] (reporting strategy default)> on Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> was not selected for reporting
default	10:02:51.234663-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3B59A7E4-84A7-455F-9218-C552F3E60F74] (reporting strategy default)> on Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> was not selected for reporting
default	10:02:51.235054-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5C31BC97-CE07-4B30-8344-115E83C4FF3E] (reporting strategy default)> on Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> was not selected for reporting
default	10:02:51.235157-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.235280-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.235378-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.238092-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [18E0607A-FF31-4295-B5FC-507F1FC1A5B3] (reporting strategy default)> on Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> was not selected for reporting
default	10:02:51.238584-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6ED67C14-7C4A-4AC7-90E0-1F5C33E5E2BF] (reporting strategy default)> on Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> was not selected for reporting
default	10:02:51.238900-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.238621-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8DBBD66C-E875-45B9-AAF4-929447EA211B] (reporting strategy default)> on Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> was not selected for reporting
default	10:02:51.239291-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.239447-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [62BCBE8F-6682-4E73-811A-6A2F741F2F65] (reporting strategy default)> on Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> was not selected for reporting
default	10:02:51.239737-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.240328-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.242465-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [46B64A14-6EA9-426A-B458-95EB5EDA93F7] (reporting strategy default)> on Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> was not selected for reporting
default	10:02:51.242898-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.243092-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [ED05E507-9007-43B2-AA14-34766A40E332] (reporting strategy default)> on Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> was not selected for reporting
default	10:02:51.244082-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2129A19A-5ABD-460E-824A-CAB6AE2E1FE1] (reporting strategy default)> on Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> was not selected for reporting
default	10:02:51.243638-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.244570-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FCB510CD-B3F4-4FAB-B7D4-7AA521BBC9D7] (reporting strategy default)> on Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> was not selected for reporting
default	10:02:51.244807-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.245122-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.246434-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [03579EA0-2F2C-4182-A496-115D1034BE08] (reporting strategy default)> on Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> was not selected for reporting
default	10:02:51.246933-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.247822-0500	RedLemon	Connection 10: starting, TC(0x0)
default	10:02:51.247889-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8D72CB8E-CA9E-4988-83AA-C555EE0753D7] (reporting strategy default)> on Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> was not selected for reporting
default	10:02:51.248029-0500	RedLemon	[C10 F8800A80-BCBD-4690-8D33-5EEFB90F8C23 127.0.0.1:47253 tcp, url hash: da190550, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{5FCC8BB4-36C1-4E68-A112-F5A7A4F351C6}{(null)}{Y}{2} (private), proc: 3970653B-7437-3725-8CBA-C148B6D75E00] start
default	10:02:51.248446-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.248971-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D9CDC8D6-3104-40C8-8EDA-85FC625522BB] (reporting strategy default)> on Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> was not selected for reporting
default	10:02:51.248581-0500	RedLemon	[C10 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:02:51.249130-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [39A5F7A9-FC7E-46F3-84D4-0CE967905741] (reporting strategy default)> on Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> was not selected for reporting
default	10:02:51.249728-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.249895-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.252157-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7912D07F-FEDE-48D9-9EFA-B48DB87826F5] (reporting strategy default)> on Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> was not selected for reporting
default	10:02:51.252269-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [ECA2F893-BBB7-407F-94D4-406914E40FFF] (reporting strategy default)> on Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> was not selected for reporting
default	10:02:51.252482-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E2BCDB55-C619-4E77-85DC-F36796EA26E9] (reporting strategy default)> on Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> was not selected for reporting
default	10:02:51.252661-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.252552-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [722110B6-29AF-4F0A-8520-E2761C4E42BB] (reporting strategy default)> on Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> was not selected for reporting
default	10:02:51.253334-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.253038-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.253555-0500	RedLemon	[C10 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.005s, uuid: A6248687-65B5-4B61-B484-2F593386664B
default	10:02:51.253758-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.255789-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [91C18500-B7C9-46EA-ADDA-259245F595C1] (reporting strategy default)> on Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> was not selected for reporting
default	10:02:51.256335-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.256480-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [09B32C1C-E251-400B-A538-1AFE94C6B53F] (reporting strategy default)> on Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> was not selected for reporting
default	10:02:51.256938-0500	RedLemon	[C10 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.008s
default	10:02:51.257154-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C10] reporting state preparing
default	10:02:51.257421-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.257631-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EE85A216-34E6-4E23-8726-BE7FAF5359B0] (reporting strategy default)> on Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> was not selected for reporting
default	10:02:51.257930-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [72FABDAC-4A7E-45AF-97E6-F3F9131A0F26] (reporting strategy default)> on Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> was not selected for reporting
default	10:02:51.258291-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.258586-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.259076-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> setting up Connection 10
default	10:02:51.260190-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [31FD1BBE-21A0-4087-BE42-1F570EC28B70] (reporting strategy default)> on Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> was not selected for reporting
default	10:02:51.260763-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CBD5A267-16F6-4CC8-AAB6-0B840496D67C] (reporting strategy default)> on Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> was not selected for reporting
default	10:02:51.261008-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [56503428-B39F-495C-9556-71A46ABF8AE5] (reporting strategy default)> on Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> was not selected for reporting
default	10:02:51.260927-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0BE687D3-7A64-4AB1-9C62-8B4AC2C078F1] (reporting strategy default)> on Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> was not selected for reporting
default	10:02:51.261481-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.261498-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.260910-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.261625-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.263695-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [159FFE2D-B466-4EE1-91B6-D9F8B87A1C47] (reporting strategy default)> on Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> was not selected for reporting
default	10:02:51.263989-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [66BEE036-C45A-412E-92C0-EAE82D57EC6A] (reporting strategy default)> on Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> was not selected for reporting
default	10:02:51.263405-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [36A1E7C5-3B43-40C3-A926-6C2B2AC6DC74] (reporting strategy default)> on Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> was not selected for reporting
default	10:02:51.264492-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.264631-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.264381-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.265400-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0A35DB32-9577-45EA-B952-BB098FC1B343] (reporting strategy default)> on Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> was not selected for reporting
default	10:02:51.266383-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.266978-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [420F6B90-16EE-4404-99F0-14DC98389E9A] (reporting strategy default)> on Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> was not selected for reporting
default	10:02:51.267733-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B76E6986-6CD2-4105-B640-E62A9CEF473E] (reporting strategy default)> on Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> was not selected for reporting
default	10:02:51.268218-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.267786-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.268352-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C5035A84-3E47-4346-81D2-7ED52FD9BDB5] (reporting strategy default)> on Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> was not selected for reporting
default	10:02:51.268958-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.268426-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F6B65FDB-62B7-4052-8174-BDC0173FA8E0] (reporting strategy default)> on Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> was not selected for reporting
default	10:02:51.269572-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.270605-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8AA1C951-57EB-4382-A27A-24A2AD633FA0] (reporting strategy default)> on Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> was not selected for reporting
default	10:02:51.271192-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.271644-0500	RedLemon	Connection 11: starting, TC(0x0)
default	10:02:51.272075-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A10A208C-7E50-4F83-96CE-87E904E2D4E4] (reporting strategy default)> on Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> was not selected for reporting
default	10:02:51.272142-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EBC50A42-C9A2-4414-AC6C-A16E292DDA62] (reporting strategy default)> on Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> was not selected for reporting
default	10:02:51.272057-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DF7296DB-E195-42BF-A0DE-1CC550C80DC2] (reporting strategy default)> on Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> was not selected for reporting
default	10:02:51.272524-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.272537-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.271802-0500	RedLemon	[C11 2E6615B7-FDC3-4493-BFD8-8C22ED3E4F23 127.0.0.1:47253 tcp, url hash: 72225575, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{5FCC8BB4-36C1-4E68-A112-F5A7A4F351C6}{(null)}{Y}{2} (private), proc: 3970653B-7437-3725-8CBA-C148B6D75E00] start
default	10:02:51.272603-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.272949-0500	RedLemon	[C11 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:02:51.274436-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3824129A-B870-428D-82C2-03A38E114654] (reporting strategy default)> on Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> was not selected for reporting
default	10:02:51.274005-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9B1C033A-51DB-4D52-A9B6-D96FE9FD88A6] (reporting strategy default)> on Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> was not selected for reporting
default	10:02:51.274924-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:02:51.275060-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [354A1922-05F6-49D6-9416-C2227D7E7315] (reporting strategy default)> on Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> was not selected for reporting
default	10:02:51.275237-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [56CDD144-377F-400A-AFB8-E46265DC9CE2] (reporting strategy default)> on Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> was not selected for reporting
default	10:02:51.276320-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E57AE448-6D8F-4D84-9F76-83C9DD8E237B] (reporting strategy default)> on Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> was not selected for reporting
default	10:02:51.276772-0500	RedLemon	[C11 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.004s, uuid: A6248687-65B5-4B61-B484-2F593386664B
default	10:02:51.277939-0500	RedLemon	[C11 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.005s
default	10:02:51.278100-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C11] reporting state preparing
default	10:02:51.278517-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> setting up Connection 11
default	10:02:51.288320-0500	RedLemon	Connection 12: starting, TC(0x0)
default	10:02:51.289232-0500	RedLemon	[C12 7BFA8EB5-A7F3-4654-AFAA-F46F08C28DA1 127.0.0.1:47253 tcp, url hash: 491716ad, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{5FCC8BB4-36C1-4E68-A112-F5A7A4F351C6}{(null)}{Y}{2} (private), proc: 3970653B-7437-3725-8CBA-C148B6D75E00] start
default	10:02:51.289427-0500	RedLemon	[C12 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:02:51.290527-0500	RedLemon	[C12 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.001s, uuid: A6248687-65B5-4B61-B484-2F593386664B
default	10:02:51.291282-0500	RedLemon	[C12 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.001s
default	10:02:51.291321-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C12] reporting state preparing
default	10:02:51.291757-0500	RedLemon	nw_flow_connected [C12 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:02:51.291891-0500	RedLemon	[C12 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.002s
default	10:02:51.291961-0500	RedLemon	nw_flow_connected [C12 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1378573142)
default	10:02:51.292776-0500	RedLemon	[C12 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.003s
default	10:02:51.292891-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C12] reporting state ready
default	10:02:51.292938-0500	RedLemon	[C12 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.003s
default	10:02:51.293014-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> setting up Connection 12
default	10:02:51.293109-0500	RedLemon	Connection 12: connected successfully
default	10:02:51.293190-0500	RedLemon	Connection 12: ready C(N) E(N)
default	10:02:51.293637-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> now using Connection 12
default	10:02:51.293821-0500	RedLemon	Connection 12: received viability advisory(Y)
default	10:02:51.294033-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> sent request, body N 0
default	10:02:51.294097-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> sent request, body N 0
default	10:02:51.294383-0500	RedLemon	Connection 13: starting, TC(0x0)
default	10:02:51.294442-0500	RedLemon	[C13 C1C2AEC3-EC24-452B-904B-69BFD40891A6 127.0.0.1:47253 tcp, url hash: 0b3dc4f2, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{5FCC8BB4-36C1-4E68-A112-F5A7A4F351C6}{(null)}{Y}{2} (private), proc: 3970653B-7437-3725-8CBA-C148B6D75E00] start
default	10:02:51.294517-0500	RedLemon	[C13 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:02:51.294631-0500	RedLemon	[C13 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: A6248687-65B5-4B61-B484-2F593386664B
default	10:02:51.295600-0500	RedLemon	[C13 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.001s
default	10:02:51.295643-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C13] reporting state preparing
default	10:02:51.295927-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> setting up Connection 13
default	10:02:51.296921-0500	RedLemon	nw_socket_handle_socket_event [C9:2] Socket received CONNECTED event
default	10:02:51.297039-0500	RedLemon	nw_flow_connected [C9 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:02:51.297086-0500	RedLemon	[C9 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.068s
default	10:02:51.297137-0500	RedLemon	nw_flow_connected [C9 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1378573142)
default	10:02:51.297277-0500	RedLemon	[C9 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.069s
default	10:02:51.297391-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C9] reporting state ready
default	10:02:51.297632-0500	RedLemon	[C9 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.069s
default	10:02:51.297744-0500	RedLemon	Connection 9: connected successfully
default	10:02:51.297833-0500	RedLemon	Connection 9: ready C(N) E(N)
default	10:02:51.298000-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> now using Connection 9
default	10:02:51.298100-0500	RedLemon	Connection 9: received viability advisory(Y)
default	10:02:51.298304-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> sent request, body N 0
default	10:02:51.298387-0500	RedLemon	nw_socket_handle_socket_event [C10:2] Socket received CONNECTED event
default	10:02:51.298507-0500	RedLemon	nw_flow_connected [C10 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:02:51.298556-0500	RedLemon	[C10 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.050s
default	10:02:51.298604-0500	RedLemon	nw_flow_connected [C10 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1378573142)
default	10:02:51.298738-0500	RedLemon	[C10 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.050s
default	10:02:51.298845-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C10] reporting state ready
default	10:02:51.299063-0500	RedLemon	[C10 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.050s
default	10:02:51.299190-0500	RedLemon	Connection 10: connected successfully
default	10:02:51.299509-0500	RedLemon	Connection 10: ready C(N) E(N)
default	10:02:51.299709-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> now using Connection 10
default	10:02:51.299808-0500	RedLemon	Connection 10: received viability advisory(Y)
default	10:02:51.300000-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> sent request, body N 0
default	10:02:51.300081-0500	RedLemon	nw_socket_handle_socket_event [C11:2] Socket received CONNECTED event
default	10:02:51.300203-0500	RedLemon	nw_flow_connected [C11 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:02:51.300251-0500	RedLemon	[C11 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.027s
default	10:02:51.300299-0500	RedLemon	nw_flow_connected [C11 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1378573142)
default	10:02:51.300435-0500	RedLemon	[C11 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.027s
default	10:02:51.300579-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C11] reporting state ready
default	10:02:51.300628-0500	RedLemon	[C11 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.027s
default	10:02:51.300689-0500	RedLemon	Connection 11: connected successfully
default	10:02:51.300810-0500	RedLemon	Connection 11: ready C(N) E(N)
default	10:02:51.301079-0500	mDNSResponder	[R4041] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, Addr) START PID[31623](RedLemon)
default	10:02:51.300985-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> now using Connection 11
default	10:02:51.301079-0500	RedLemon	Connection 11: received viability advisory(Y)
default	10:02:51.301326-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> sent request, body N 0
default	10:02:51.301422-0500	RedLemon	nw_socket_handle_socket_event [C12:2] Socket received CONNECTED event
default	10:02:51.301539-0500	RedLemon	nw_flow_connected [C12 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:02:51.301592-0500	RedLemon	[C12 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.012s
default	10:02:51.301640-0500	RedLemon	nw_flow_connected [C12 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1378573142)
default	10:02:51.302133-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> received response, status 200 content K
default	10:02:51.302350-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> response ended
default	10:02:51.302723-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> done using Connection 8
default	10:02:51.302886-0500	RedLemon	nw_socket_handle_socket_event [C13:2] Socket received CONNECTED event
default	10:02:51.303709-0500	RedLemon	nw_flow_connected [C13 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:02:51.303771-0500	RedLemon	[C13 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.009s
default	10:02:51.303826-0500	RedLemon	nw_flow_connected [C13 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1378573142)
default	10:02:51.304105-0500	RedLemon	[C13 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.009s
default	10:02:51.304311-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C13] reporting state ready
default	10:02:51.304369-0500	RedLemon	[C13 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.009s
default	10:02:51.304435-0500	RedLemon	Connection 13: connected successfully
default	10:02:51.304517-0500	RedLemon	Connection 13: ready C(N) E(N)
default	10:02:51.304841-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> now using Connection 13
default	10:02:51.304940-0500	RedLemon	Connection 13: received viability advisory(Y)
default	10:02:51.305176-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> sent request, body N 0
default	10:02:51.305435-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> now using Connection 8
default	10:02:51.306087-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> sent request, body N 0
default	10:02:51.306130-0500	mDNSResponder	[R4042] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, AAAA) START PID[31623](RedLemon)
default	10:02:51.307524-0500	mDNSResponder	[R4043] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, Addr) START PID[31623](RedLemon)
default	10:02:51.307830-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> summary for task success {transaction_duration_ms=100, response_status=200, connection=8, reused=1, request_start_ms=7, request_duration_ms=79, response_start_ms=94, response_duration_ms=0, request_bytes=245, response_bytes=2718, cache_hit=false}
default	10:02:51.308054-0500	mDNSResponder	[R4044] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, AAAA) START PID[31623](RedLemon)
default	10:02:51.308914-0500	RedLemon	Task <2C993F76-64E8-49B2-8D98-C9174582ED8A>.<4> finished successfully
default	10:02:51.309298-0500	RedLemon	📡 Raw metadata response length: 2616 bytes
default	10:02:51.309473-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.309365-0500	mDNSResponder	[R4041] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, Addr) STOP PID[31623](RedLemon)
default	10:02:51.309657-0500	mDNSResponder	[R4042] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, AAAA) STOP PID[31623](RedLemon)
default	10:02:51.309910-0500	mDNSResponder	[R4045] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, Addr) START PID[31623](RedLemon)
default	10:02:51.311139-0500	mDNSResponder	[R4046] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, AAAA) START PID[31623](RedLemon)
default	10:02:51.311408-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.312612-0500	mDNSResponder	[R4043] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, Addr) STOP PID[31623](RedLemon)
default	10:02:51.312778-0500	mDNSResponder	[R4044] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, AAAA) STOP PID[31623](RedLemon)
default	10:02:51.313008-0500	mDNSResponder	[R4045] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, Addr) STOP PID[31623](RedLemon)
default	10:02:51.313105-0500	mDNSResponder	[R4046] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, AAAA) STOP PID[31623](RedLemon)
default	10:02:51.313280-0500	mDNSResponder	[R4047] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, Addr) START PID[31623](RedLemon)
default	10:02:51.314218-0500	mDNSResponder	[R4048] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, AAAA) START PID[31623](RedLemon)
default	10:02:51.315074-0500	mDNSResponder	[R4049] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, Addr) START PID[31623](RedLemon)
default	10:02:51.316302-0500	mDNSResponder	[R4050] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'g8r19902BUyMDhkDHupmCQ=='>, AAAA) START PID[31623](RedLemon)
default	10:02:51.317162-0500	mDNSResponder	[R4047] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, Addr) STOP PID[31623](RedLemon)
default	10:02:51.317239-0500	mDNSResponder	[R4048] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, AAAA) STOP PID[31623](RedLemon)
default	10:02:51.317359-0500	mDNSResponder	[R4049] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, Addr) STOP PID[31623](RedLemon)
default	10:02:51.317445-0500	mDNSResponder	[R4050] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'SycQY09k7aEjlG2DoqCLCA=='>, AAAA) STOP PID[31623](RedLemon)
default	10:02:51.326037-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> received response, status 200 content K
default	10:02:51.326339-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> response ended
default	10:02:51.326387-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> done using Connection 12
default	10:02:51.326641-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> now using Connection 12
default	10:02:51.326756-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> summary for task success {transaction_duration_ms=116, response_status=200, connection=12, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=2, secure_connection_duration_ms=0, private_relay=false, request_start_ms=83, request_duration_ms=0, response_start_ms=115, response_duration_ms=0, request_bytes=245, response_bytes=1526, cache_hit=false}
default	10:02:51.326956-0500	RedLemon	Task <BF057644-1254-48F9-A6B2-3A7810FB837B>.<6> finished successfully
default	10:02:51.327104-0500	RedLemon	📡 Raw metadata response length: 1424 bytes
default	10:02:51.327246-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.327106-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> sent request, body N 0
default	10:02:51.327872-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.551955-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> received response, status 200 content K
default	10:02:51.552336-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> response ended
default	10:02:51.552391-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> done using Connection 10
default	10:02:51.552555-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> summary for task success {transaction_duration_ms=342, response_status=200, connection=10, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=42, secure_connection_duration_ms=0, private_relay=false, request_start_ms=90, request_duration_ms=0, response_start_ms=341, response_duration_ms=0, request_bytes=245, response_bytes=2562, cache_hit=false}
default	10:02:51.552568-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> now using Connection 10
default	10:02:51.552757-0500	RedLemon	Task <B8BA3F90-D84F-43C7-ACC1-5316C6CCE32F>.<8> finished successfully
default	10:02:51.552932-0500	RedLemon	📡 Raw metadata response length: 2460 bytes
default	10:02:51.553092-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.553606-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.554742-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> sent request, body N 0
default	10:02:51.584656-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> received response, status 200 content K
default	10:02:51.584929-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> response ended
default	10:02:51.585007-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> done using Connection 11
default	10:02:51.585169-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> summary for task success {transaction_duration_ms=375, response_status=200, connection=11, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=22, secure_connection_duration_ms=0, private_relay=false, request_start_ms=91, request_duration_ms=0, response_start_ms=374, response_duration_ms=0, request_bytes=245, response_bytes=2428, cache_hit=false}
default	10:02:51.585197-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> now using Connection 11
default	10:02:51.585370-0500	RedLemon	Task <CCED7BEC-F8E2-4311-BBA3-30355275ADAE>.<7> finished successfully
default	10:02:51.585527-0500	RedLemon	📡 Raw metadata response length: 2326 bytes
default	10:02:51.585684-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.586262-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.586571-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> sent request, body N 0
default	10:02:51.603298-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> received response, status 200 content K
default	10:02:51.603552-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> response ended
default	10:02:51.603602-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> done using Connection 13
default	10:02:51.603763-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> now using Connection 13
default	10:02:51.603847-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> summary for task success {transaction_duration_ms=391, response_status=200, connection=13, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=8, secure_connection_duration_ms=0, private_relay=false, request_start_ms=93, request_duration_ms=0, response_start_ms=391, response_duration_ms=0, request_bytes=245, response_bytes=2726, cache_hit=false}
default	10:02:51.604029-0500	RedLemon	Task <46B24F60-3E09-45C0-AE44-C270097EA070>.<10> finished successfully
default	10:02:51.604023-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> sent request, body N 0
default	10:02:51.604178-0500	RedLemon	📡 Raw metadata response length: 2624 bytes
default	10:02:51.604338-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.604847-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.617981-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> received response, status 200 content K
default	10:02:51.618197-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> response ended
default	10:02:51.618246-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> done using Connection 8
default	10:02:51.618351-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> summary for task success {transaction_duration_ms=405, response_status=200, connection=8, reused=1, request_start_ms=92, request_duration_ms=0, response_start_ms=404, response_duration_ms=0, request_bytes=245, response_bytes=2239, cache_hit=false}
default	10:02:51.618388-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> now using Connection 8
default	10:02:51.618560-0500	RedLemon	Task <56CF96CE-E2FA-4478-9CF4-0B1ECCF83F2C>.<9> finished successfully
default	10:02:51.618638-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> sent request, body N 0
default	10:02:51.618751-0500	RedLemon	📡 Raw metadata response length: 2137 bytes
default	10:02:51.618906-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.619369-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.623749-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> received response, status 200 content K
default	10:02:51.623992-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> response ended
default	10:02:51.624043-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> done using Connection 12
default	10:02:51.624161-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> summary for task success {transaction_duration_ms=411, response_status=200, connection=12, reused=1, request_start_ms=113, request_duration_ms=0, response_start_ms=410, response_duration_ms=0, request_bytes=245, response_bytes=2469, cache_hit=false}
default	10:02:51.624219-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> now using Connection 12
default	10:02:51.624376-0500	RedLemon	Task <6D50D6ED-2155-4951-8D50-A9560D6709E9>.<11> finished successfully
default	10:02:51.624486-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> sent request, body N 0
default	10:02:51.624558-0500	RedLemon	📡 Raw metadata response length: 2367 bytes
default	10:02:51.624718-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.625390-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.634380-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> received response, status 200 content K
default	10:02:51.634701-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> response ended
default	10:02:51.634754-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> done using Connection 10
default	10:02:51.634856-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> summary for task success {transaction_duration_ms=421, response_status=200, connection=10, reused=1, request_start_ms=340, request_duration_ms=0, response_start_ms=420, response_duration_ms=0, request_bytes=245, response_bytes=2441, cache_hit=false}
default	10:02:51.635067-0500	RedLemon	Task <5AA047DD-A817-49E6-942F-1EAA741119E4>.<12> finished successfully
default	10:02:51.635174-0500	RedLemon	📡 Raw metadata response length: 2339 bytes
default	10:02:51.635166-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> now using Connection 10
default	10:02:51.635503-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.636370-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> sent request, body N 0
default	10:02:51.636619-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.636646-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> received response, status 200 content K
default	10:02:51.637181-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> response ended
default	10:02:51.637243-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> done using Connection 13
default	10:02:51.637398-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> now using Connection 13
default	10:02:51.637468-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> summary for task success {transaction_duration_ms=421, response_status=200, connection=13, reused=1, request_start_ms=387, request_duration_ms=0, response_start_ms=420, response_duration_ms=0, request_bytes=245, response_bytes=2785, cache_hit=false}
default	10:02:51.637645-0500	RedLemon	Task <5B72147D-7F10-4F40-8FA2-EBC3B6553CE4>.<13> finished successfully
default	10:02:51.637785-0500	RedLemon	📡 Raw metadata response length: 2683 bytes
default	10:02:51.637717-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> sent request, body N 0
default	10:02:51.638103-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.638763-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.638850-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> received response, status 200 content K
default	10:02:51.639678-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> response ended
default	10:02:51.639734-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> done using Connection 11
default	10:02:51.639885-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> now using Connection 11
default	10:02:51.640146-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> summary for task success {transaction_duration_ms=424, response_status=200, connection=11, reused=1, request_start_ms=369, request_duration_ms=1, response_start_ms=422, response_duration_ms=1, request_bytes=245, response_bytes=2882, cache_hit=false}
default	10:02:51.640402-0500	RedLemon	Task <D07F0DE7-0C11-42A3-B9C7-453486D2A5AF>.<15> finished successfully
default	10:02:51.640670-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> sent request, body N 0
default	10:02:51.640749-0500	RedLemon	📡 Raw metadata response length: 2780 bytes
default	10:02:51.641086-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.641988-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.640894-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> received response, status 200 content K
default	10:02:51.642643-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> response ended
default	10:02:51.642699-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> done using Connection 9
default	10:02:51.642879-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> now using Connection 9
default	10:02:51.642906-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> summary for task success {transaction_duration_ms=433, response_status=200, connection=9, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=65, secure_connection_duration_ms=0, private_relay=false, request_start_ms=89, request_duration_ms=0, response_start_ms=431, response_duration_ms=1, request_bytes=245, response_bytes=2462, cache_hit=false}
default	10:02:51.643142-0500	RedLemon	Task <8D9F3F6C-E943-440D-9233-1363E47C1AAF>.<5> finished successfully
default	10:02:51.643258-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> sent request, body N 0
default	10:02:51.643317-0500	RedLemon	📡 Raw metadata response length: 2360 bytes
default	10:02:51.643455-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.643949-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.652497-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> received response, status 200 content K
default	10:02:51.652771-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> response ended
default	10:02:51.652823-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> done using Connection 8
default	10:02:51.652981-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> now using Connection 8
default	10:02:51.653050-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> summary for task success {transaction_duration_ms=436, response_status=200, connection=8, reused=1, request_start_ms=402, request_duration_ms=0, response_start_ms=436, response_duration_ms=0, request_bytes=244, response_bytes=3714, cache_hit=false}
default	10:02:51.653249-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> sent request, body N 0
default	10:02:51.653294-0500	RedLemon	Task <2D9A3BF7-FFBA-4C71-90DB-A5BE2195C15A>.<14> finished successfully
default	10:02:51.653429-0500	RedLemon	📡 Raw metadata response length: 3612 bytes
default	10:02:51.653605-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.654316-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.659189-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> received response, status 200 content K
default	10:02:51.659893-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> response ended
default	10:02:51.659955-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> done using Connection 12
default	10:02:51.660063-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> summary for task success {transaction_duration_ms=443, response_status=200, connection=12, reused=1, request_start_ms=407, request_duration_ms=0, response_start_ms=442, response_duration_ms=0, request_bytes=245, response_bytes=5584, cache_hit=false}
default	10:02:51.660106-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> now using Connection 12
default	10:02:51.660343-0500	RedLemon	Task <CE660FED-85A5-43DC-B885-6132678AE062>.<16> finished successfully
default	10:02:51.660500-0500	RedLemon	📡 Raw metadata response length: 5482 bytes
default	10:02:51.660518-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> sent request, body N 0
default	10:02:51.660907-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.661969-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.669213-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> received response, status 200 content K
default	10:02:51.669861-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> response ended
default	10:02:51.669931-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> done using Connection 13
default	10:02:51.670092-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> now using Connection 13
default	10:02:51.670245-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> summary for task success {transaction_duration_ms=450, response_status=200, connection=13, reused=1, request_start_ms=418, request_duration_ms=0, response_start_ms=449, response_duration_ms=0, request_bytes=245, response_bytes=2535, cache_hit=false}
default	10:02:51.670897-0500	RedLemon	Task <07B7F07A-7BB6-427B-8DA0-DC9E7BA0BAD7>.<19> finished successfully
default	10:02:51.671242-0500	RedLemon	📡 Raw metadata response length: 2433 bytes
default	10:02:51.671792-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.672323-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.670948-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> sent request, body N 0
default	10:02:51.674869-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> received response, status 200 content K
default	10:02:51.675182-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> response ended
default	10:02:51.675241-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> done using Connection 11
default	10:02:51.675390-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> now using Connection 11
default	10:02:51.675646-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> sent request, body N 0
default	10:02:51.675719-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> summary for task success {transaction_duration_ms=456, response_status=200, connection=11, reused=1, request_start_ms=420, request_duration_ms=0, response_start_ms=455, response_duration_ms=0, request_bytes=244, response_bytes=2631, cache_hit=false}
default	10:02:51.675909-0500	RedLemon	Task <F5F80A72-3DEC-4621-8A60-7D340E504225>.<17> finished successfully
default	10:02:51.676043-0500	RedLemon	📡 Raw metadata response length: 2529 bytes
default	10:02:51.676186-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.676708-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.677874-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> received response, status 200 content K
default	10:02:51.678100-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> response ended
default	10:02:51.678148-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> done using Connection 9
default	10:02:51.678385-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> summary for task success {transaction_duration_ms=458, response_status=200, connection=9, reused=1, request_start_ms=422, request_duration_ms=0, response_start_ms=457, response_duration_ms=0, request_bytes=245, response_bytes=2177, cache_hit=false}
default	10:02:51.678291-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> now using Connection 9
default	10:02:51.678947-0500	RedLemon	Task <AE54DAED-6D7A-46CF-B0D4-A089AE416DC9>.<20> finished successfully
default	10:02:51.679096-0500	RedLemon	📡 Raw metadata response length: 2075 bytes
default	10:02:51.679267-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.679750-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.679707-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> sent request, body N 0
default	10:02:51.680233-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> received response, status 200 content K
default	10:02:51.680757-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> response ended
default	10:02:51.680896-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> done using Connection 10
default	10:02:51.681281-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> now using Connection 10
default	10:02:51.681505-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> summary for task success {transaction_duration_ms=462, response_status=200, connection=10, reused=1, request_start_ms=417, request_duration_ms=0, response_start_ms=461, response_duration_ms=1, request_bytes=245, response_bytes=2339, cache_hit=false}
default	10:02:51.681700-0500	RedLemon	Task <D8E3FC46-7C42-43C0-920B-64062538D1C6>.<18> finished successfully
default	10:02:51.681824-0500	RedLemon	📡 Raw metadata response length: 2237 bytes
default	10:02:51.681976-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.682075-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> sent request, body N 0
default	10:02:51.682426-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.686172-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> received response, status 200 content K
default	10:02:51.686881-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> response ended
default	10:02:51.686929-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> done using Connection 12
default	10:02:51.687036-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> summary for task success {transaction_duration_ms=464, response_status=200, connection=12, reused=1, request_start_ms=438, request_duration_ms=0, response_start_ms=463, response_duration_ms=1, request_bytes=245, response_bytes=2445, cache_hit=false}
default	10:02:51.687067-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> now using Connection 12
default	10:02:51.687231-0500	RedLemon	Task <21B106D8-F5D7-4A81-9E78-5F3A817AD29C>.<23> finished successfully
default	10:02:51.687335-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> sent request, body N 0
default	10:02:51.687377-0500	RedLemon	📡 Raw metadata response length: 2343 bytes
default	10:02:51.687585-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.688065-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.695060-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> received response, status 200 content K
default	10:02:51.695355-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> response ended
default	10:02:51.695405-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> done using Connection 8
default	10:02:51.695488-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> summary for task success {transaction_duration_ms=473, response_status=200, connection=8, reused=1, request_start_ms=431, request_duration_ms=0, response_start_ms=473, response_duration_ms=0, request_bytes=245, response_bytes=2408, cache_hit=false}
default	10:02:51.695522-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> now using Connection 8
default	10:02:51.695666-0500	RedLemon	Task <B2EA6E58-B880-4A14-85BD-5B6890C63BF4>.<21> finished successfully
default	10:02:51.695805-0500	RedLemon	📡 Raw metadata response length: 2306 bytes
default	10:02:51.695813-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> sent request, body N 0
default	10:02:51.695955-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.696432-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.700860-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> received response, status 200 content K
default	10:02:51.701116-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> response ended
default	10:02:51.701168-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> done using Connection 13
default	10:02:51.701276-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> summary for task success {transaction_duration_ms=477, response_status=200, connection=13, reused=1, request_start_ms=447, request_duration_ms=0, response_start_ms=477, response_duration_ms=0, request_bytes=245, response_bytes=2530, cache_hit=false}
default	10:02:51.701308-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> now using Connection 13
default	10:02:51.701484-0500	RedLemon	Task <3F2B7320-E572-48C4-A660-A1FBADF3F73E>.<24> finished successfully
default	10:02:51.701679-0500	RedLemon	📡 Raw metadata response length: 2428 bytes
default	10:02:51.701736-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> sent request, body N 0
default	10:02:51.701829-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.702373-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.714170-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> received response, status 200 content K
default	10:02:51.714397-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> response ended
default	10:02:51.714446-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> done using Connection 10
default	10:02:51.714559-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> summary for task success {transaction_duration_ms=489, response_status=200, connection=10, reused=1, request_start_ms=456, request_duration_ms=0, response_start_ms=488, response_duration_ms=0, request_bytes=245, response_bytes=2141, cache_hit=false}
default	10:02:51.714636-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> now using Connection 10
default	10:02:51.714757-0500	RedLemon	Task <EABB7084-A54F-42BC-B2D2-C328DC95935E>.<26> finished successfully
default	10:02:51.714956-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> sent request, body N 0
default	10:02:51.714979-0500	RedLemon	📡 Raw metadata response length: 2039 bytes
default	10:02:51.715128-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.715596-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.719074-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> received response, status 200 content K
default	10:02:51.719418-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> response ended
default	10:02:51.719507-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> done using Connection 11
default	10:02:51.719664-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> now using Connection 11
default	10:02:51.719625-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> summary for task success {transaction_duration_ms=496, response_status=200, connection=11, reused=1, request_start_ms=452, request_duration_ms=0, response_start_ms=495, response_duration_ms=0, request_bytes=245, response_bytes=2198, cache_hit=false}
default	10:02:51.719883-0500	RedLemon	Task <1961F266-131E-4CED-BA90-7EECB0D81B51>.<22> finished successfully
default	10:02:51.720030-0500	RedLemon	📡 Raw metadata response length: 2096 bytes
default	10:02:51.720105-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> sent request, body N 0
default	10:02:51.720242-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.721025-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.723911-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> received response, status 200 content K
default	10:02:51.724093-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> response ended
default	10:02:51.724143-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> done using Connection 12
default	10:02:51.724220-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> summary for task success {transaction_duration_ms=496, response_status=200, connection=12, reused=1, request_start_ms=459, request_duration_ms=0, response_start_ms=496, response_duration_ms=0, request_bytes=244, response_bytes=2765, cache_hit=false}
default	10:02:51.724256-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> now using Connection 12
default	10:02:51.724400-0500	RedLemon	Task <BC2E6F4F-4506-4184-AAAD-31FB452D260F>.<27> finished successfully
default	10:02:51.724550-0500	RedLemon	📡 Raw metadata response length: 2663 bytes
default	10:02:51.724641-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> sent request, body N 0
default	10:02:51.724704-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.725562-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.735323-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> received response, status 200 content K
default	10:02:51.735615-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> response ended
default	10:02:51.735663-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> done using Connection 13
default	10:02:51.735769-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> summary for task success {transaction_duration_ms=507, response_status=200, connection=13, reused=1, request_start_ms=473, request_duration_ms=0, response_start_ms=507, response_duration_ms=0, request_bytes=245, response_bytes=2544, cache_hit=false}
default	10:02:51.735806-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> now using Connection 13
default	10:02:51.735985-0500	RedLemon	Task <385280D3-51C1-4FD8-BF8B-502280655FDB>.<29> finished successfully
default	10:02:51.736069-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> sent request, body N 0
default	10:02:51.736181-0500	RedLemon	📡 Raw metadata response length: 2442 bytes
default	10:02:51.736326-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.736804-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.745698-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> received response, status 200 content K
default	10:02:51.745927-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> response ended
default	10:02:51.745975-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> done using Connection 10
default	10:02:51.746150-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> now using Connection 10
default	10:02:51.746356-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> summary for task success {transaction_duration_ms=517, response_status=200, connection=10, reused=1, request_start_ms=485, request_duration_ms=0, response_start_ms=516, response_duration_ms=0, request_bytes=244, response_bytes=2714, cache_hit=false}
default	10:02:51.746443-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> sent request, body N 0
default	10:02:51.746551-0500	RedLemon	Task <086F6380-05A5-437A-9ACB-B1E532161FB8>.<30> finished successfully
default	10:02:51.746581-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> received response, status 200 content K
default	10:02:51.746722-0500	RedLemon	📡 Raw metadata response length: 2612 bytes
default	10:02:51.747098-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.747972-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.748167-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> response ended
default	10:02:51.748245-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> done using Connection 9
default	10:02:51.748406-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> now using Connection 9
default	10:02:51.748481-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> summary for task success {transaction_duration_ms=523, response_status=200, connection=9, reused=1, request_start_ms=454, request_duration_ms=0, response_start_ms=521, response_duration_ms=1, request_bytes=245, response_bytes=2723, cache_hit=false}
default	10:02:51.749161-0500	RedLemon	Task <CF91A43D-A8E4-4BCB-8755-3CC4FC39D907>.<25> finished successfully
default	10:02:51.749365-0500	RedLemon	📡 Raw metadata response length: 2621 bytes
default	10:02:51.749609-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.750205-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> sent request, body N 0
default	10:02:51.750601-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.751933-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> received response, status 200 content K
default	10:02:51.752535-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> response ended
default	10:02:51.752604-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> done using Connection 11
default	10:02:51.752856-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> now using Connection 11
default	10:02:51.752924-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> summary for task success {transaction_duration_ms=522, response_status=200, connection=11, reused=1, request_start_ms=488, request_duration_ms=0, response_start_ms=520, response_duration_ms=0, request_bytes=245, response_bytes=2802, cache_hit=false}
default	10:02:51.753114-0500	RedLemon	Task <0FA8A745-6587-4FD9-9E8E-90D9BB8BCB24>.<33> finished successfully
default	10:02:51.753331-0500	RedLemon	📡 Raw metadata response length: 2700 bytes
default	10:02:51.753643-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.754321-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.753665-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> sent request, body N 0
default	10:02:51.758192-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> received response, status 200 content K
default	10:02:51.758430-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> response ended
default	10:02:51.758477-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> done using Connection 8
default	10:02:51.758621-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> now using Connection 8
default	10:02:51.758822-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> summary for task success {transaction_duration_ms=530, response_status=200, connection=8, reused=1, request_start_ms=467, request_duration_ms=0, response_start_ms=530, response_duration_ms=0, request_bytes=245, response_bytes=1392, cache_hit=false}
default	10:02:51.759757-0500	RedLemon	Task <0F4324F3-24BC-4C34-ADA4-CE32F6CF1A63>.<28> finished successfully
default	10:02:51.759922-0500	RedLemon	📡 Raw metadata response length: 1290 bytes
default	10:02:51.760107-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.760351-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> sent request, body N 0
default	10:02:51.760508-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.760508-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> received response, status 200 content K
default	10:02:51.762247-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> response ended
default	10:02:51.762303-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> done using Connection 12
default	10:02:51.762444-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> now using Connection 12
default	10:02:51.762744-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> sent request, body N 0
default	10:02:51.762792-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> summary for task success {transaction_duration_ms=530, response_status=200, connection=12, reused=1, request_start_ms=492, request_duration_ms=0, response_start_ms=528, response_duration_ms=1, request_bytes=244, response_bytes=2344, cache_hit=false}
default	10:02:51.762983-0500	RedLemon	Task <A6FF2BA2-3285-4434-AFBA-49B2E8C0021C>.<32> finished successfully
default	10:02:51.763112-0500	RedLemon	📡 Raw metadata response length: 2242 bytes
default	10:02:51.763272-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.763761-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.775614-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> received response, status 200 content K
default	10:02:51.775909-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> response ended
default	10:02:51.775960-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> done using Connection 13
default	10:02:51.776074-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> summary for task success {transaction_duration_ms=543, response_status=200, connection=13, reused=1, request_start_ms=503, request_duration_ms=0, response_start_ms=543, response_duration_ms=0, request_bytes=245, response_bytes=2625, cache_hit=false}
default	10:02:51.776106-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> now using Connection 13
default	10:02:51.776271-0500	RedLemon	Task <746AA3F1-2841-4EDE-8668-4E994F850774>.<31> finished successfully
default	10:02:51.776422-0500	RedLemon	📡 Raw metadata response length: 2523 bytes
default	10:02:51.776495-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> sent request, body N 0
default	10:02:51.776576-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.777084-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.780268-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> received response, status 200 content K
default	10:02:51.780560-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> response ended
default	10:02:51.780668-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> done using Connection 10
default	10:02:51.780821-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> now using Connection 10
default	10:02:51.780816-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> summary for task success {transaction_duration_ms=548, response_status=200, connection=10, reused=1, request_start_ms=514, request_duration_ms=0, response_start_ms=547, response_duration_ms=0, request_bytes=245, response_bytes=2289, cache_hit=false}
default	10:02:51.781202-0500	RedLemon	Task <FC448B1F-EB9F-44EC-9912-6449A8BC0ADE>.<34> finished successfully
default	10:02:51.781362-0500	RedLemon	📡 Raw metadata response length: 2187 bytes
default	10:02:51.781526-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.782048-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.782983-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> sent request, body N 0
default	10:02:51.783212-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> received response, status 200 content K
default	10:02:51.783580-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> response ended
default	10:02:51.783633-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> done using Connection 11
default	10:02:51.784121-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> received response, status 200 content K
default	10:02:51.784234-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> summary for task success {transaction_duration_ms=547, response_status=200, connection=11, reused=1, request_start_ms=516, request_duration_ms=0, response_start_ms=546, response_duration_ms=0, request_bytes=245, response_bytes=2507, cache_hit=false}
default	10:02:51.784451-0500	RedLemon	Task <FB1C6045-42FC-4051-8D27-53C9960B8B84>.<35> finished successfully
default	10:02:51.784591-0500	RedLemon	📡 Raw metadata response length: 2405 bytes
default	10:02:51.784761-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.785463-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> response ended
default	10:02:51.785523-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> done using Connection 9
default	10:02:51.785850-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.787215-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> summary for task success {transaction_duration_ms=552, response_status=200, connection=9, reused=1, request_start_ms=514, request_duration_ms=0, response_start_ms=549, response_duration_ms=1, request_bytes=245, response_bytes=2481, cache_hit=false}
default	10:02:51.787436-0500	RedLemon	Task <7D8E7258-7F09-4D33-A168-A878F9FE7370>.<36> finished successfully
default	10:02:51.787566-0500	RedLemon	📡 Raw metadata response length: 2379 bytes
default	10:02:51.787734-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.785687-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> now using Connection 11
default	10:02:51.788347-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> now using Connection 9
default	10:02:51.788660-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.789953-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> sent request, body N 0
default	10:02:51.790194-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> sent request, body N 0
default	10:02:51.792901-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> received response, status 200 content K
default	10:02:51.793339-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> response ended
default	10:02:51.793402-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> done using Connection 8
default	10:02:51.793968-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> now using Connection 8
default	10:02:51.794219-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> summary for task success {transaction_duration_ms=557, response_status=200, connection=8, reused=1, request_start_ms=522, request_duration_ms=0, response_start_ms=555, response_duration_ms=1, request_bytes=245, response_bytes=2259, cache_hit=false}
default	10:02:51.794300-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> sent request, body N 0
default	10:02:51.794548-0500	RedLemon	Task <B122C26D-2C14-4B67-985C-C87E60E4B341>.<37> finished successfully
default	10:02:51.794734-0500	RedLemon	📡 Raw metadata response length: 2157 bytes
default	10:02:51.794895-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.795629-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.799386-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> received response, status 200 content K
default	10:02:51.800313-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> response ended
default	10:02:51.800365-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> done using Connection 12
default	10:02:51.800452-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> summary for task success {transaction_duration_ms=563, response_status=200, connection=12, reused=1, request_start_ms=525, request_duration_ms=0, response_start_ms=561, response_duration_ms=1, request_bytes=245, response_bytes=2381, cache_hit=false}
default	10:02:51.800482-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> now using Connection 12
default	10:02:51.800641-0500	RedLemon	Task <5E0DAA93-0324-4BD2-9260-16D96435B961>.<38> finished successfully
default	10:02:51.800883-0500	RedLemon	📡 Raw metadata response length: 2279 bytes
default	10:02:51.800905-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> sent request, body N 0
default	10:02:51.801044-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.801723-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.805591-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> received response, status 200 content K
default	10:02:51.805866-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> response ended
default	10:02:51.805928-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> done using Connection 13
default	10:02:51.806082-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> now using Connection 13
default	10:02:51.806093-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> summary for task success {transaction_duration_ms=567, response_status=200, connection=13, reused=1, request_start_ms=537, request_duration_ms=0, response_start_ms=566, response_duration_ms=0, request_bytes=245, response_bytes=1521, cache_hit=false}
default	10:02:51.806296-0500	RedLemon	Task <50C34568-E11A-4C0D-9DA1-E21BBB3BE394>.<40> finished successfully
default	10:02:51.806500-0500	RedLemon	📡 Raw metadata response length: 1419 bytes
default	10:02:51.806771-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.807153-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.807435-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> sent request, body N 0
default	10:02:51.814264-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> received response, status 200 content K
default	10:02:51.814609-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> response ended
default	10:02:51.814678-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> done using Connection 10
default	10:02:51.814810-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> summary for task success {transaction_duration_ms=573, response_status=200, connection=10, reused=1, request_start_ms=541, request_duration_ms=0, response_start_ms=573, response_duration_ms=0, request_bytes=245, response_bytes=2426, cache_hit=false}
default	10:02:51.814840-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> now using Connection 10
default	10:02:51.815009-0500	RedLemon	Task <3C5AB35F-7974-4CEB-BC48-4AA79CECC4D6>.<39> finished successfully
default	10:02:51.815123-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> sent request, body N 0
default	10:02:51.815154-0500	RedLemon	📡 Raw metadata response length: 2324 bytes
default	10:02:51.815300-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.815871-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.819480-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> received response, status 200 content K
default	10:02:51.819879-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> response ended
default	10:02:51.819967-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> done using Connection 11
default	10:02:51.820171-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> now using Connection 11
default	10:02:51.820555-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> summary for task success {transaction_duration_ms=579, response_status=200, connection=11, reused=1, request_start_ms=548, request_duration_ms=0, response_start_ms=578, response_duration_ms=0, request_bytes=244, response_bytes=2500, cache_hit=false}
default	10:02:51.820576-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> sent request, body N 0
default	10:02:51.820774-0500	RedLemon	Task <42FEB8A8-5BA2-4478-8449-EB4592A6C570>.<41> finished successfully
default	10:02:51.820992-0500	RedLemon	📡 Raw metadata response length: 2398 bytes
default	10:02:51.821135-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	10:02:51.821801-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	10:02:51.823762-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> received response, status 200 content K
default	10:02:51.824027-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> response ended
default	10:02:51.824089-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> done using Connection 8
default	10:02:51.824209-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> summary for task success {transaction_duration_ms=580, response_status=200, connection=8, reused=1, request_start_ms=550, request_duration_ms=0, response_start_ms=580, response_duration_ms=0, request_bytes=245, response_bytes=2867, cache_hit=false}
default	10:02:51.824237-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> now using Connection 8
default	10:02:51.824409-0500	RedLemon	Task <ABE988FE-9189-4A74-BADE-EA133876E016>.<44> finished successfully
default	10:02:51.824595-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> sent request, body N 0
default	10:02:51.824624-0500	RedLemon	📡 Raw metadata response length: 2765 bytes
default	10:02:51.824771-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.825464-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.830935-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> received response, status 200 content K
default	10:02:51.831321-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> response ended
default	10:02:51.831410-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> done using Connection 9
default	10:02:51.831685-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> summary for task success {transaction_duration_ms=589, response_status=200, connection=9, reused=1, request_start_ms=548, request_duration_ms=0, response_start_ms=588, response_duration_ms=0, request_bytes=244, response_bytes=1978, cache_hit=false}
default	10:02:51.831760-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> received response, status 200 content K
default	10:02:51.831896-0500	RedLemon	Task <A715C8BE-423A-4CCE-9B98-562C60F4CDCC>.<42> finished successfully
default	10:02:51.831948-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> response ended
default	10:02:51.831993-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> done using Connection 12
default	10:02:51.832076-0500	RedLemon	📡 Raw metadata response length: 1876 bytes
default	10:02:51.832319-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.832319-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> now using Connection 9
default	10:02:51.832492-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> summary for task success {transaction_duration_ms=588, response_status=200, connection=12, reused=1, request_start_ms=556, request_duration_ms=0, response_start_ms=587, response_duration_ms=0, request_bytes=245, response_bytes=2421, cache_hit=false}
default	10:02:51.832648-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> now using Connection 12
default	10:02:51.832751-0500	RedLemon	Task <90B24A3E-91DB-49AB-B4F7-45D575020D86>.<43> finished successfully
default	10:02:51.832765-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.832954-0500	RedLemon	📡 Raw metadata response length: 2319 bytes
default	10:02:51.833441-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.833827-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> sent request, body N 0
default	10:02:51.834086-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.834314-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> sent request, body N 0
default	10:02:51.844661-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> received response, status 200 content K
default	10:02:51.845012-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> response ended
default	10:02:51.845097-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> done using Connection 13
default	10:02:51.845241-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> now using Connection 13
default	10:02:51.845215-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> summary for task success {transaction_duration_ms=599, response_status=200, connection=13, reused=1, request_start_ms=560, request_duration_ms=1, response_start_ms=599, response_duration_ms=0, request_bytes=245, response_bytes=2380, cache_hit=false}
default	10:02:51.845474-0500	RedLemon	Task <1E281DA2-79F5-4B65-B98D-29E5AFD34AB2>.<45> finished successfully
default	10:02:51.845515-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> sent request, body N 0
default	10:02:51.845582-0500	RedLemon	📡 Raw metadata response length: 2278 bytes
default	10:02:51.845741-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.846244-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.851303-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> received response, status 200 content K
default	10:02:51.851708-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> response ended
default	10:02:51.851763-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> done using Connection 11
default	10:02:51.852046-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> now using Connection 11
default	10:02:51.852191-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> summary for task success {transaction_duration_ms=604, response_status=200, connection=11, reused=1, request_start_ms=573, request_duration_ms=0, response_start_ms=603, response_duration_ms=0, request_bytes=245, response_bytes=2638, cache_hit=false}
default	10:02:51.852452-0500	RedLemon	Task <C4356486-C0AE-4289-BDE0-50570798A1A3>.<47> finished successfully
default	10:02:51.852648-0500	RedLemon	📡 Raw metadata response length: 2536 bytes
default	10:02:51.852802-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.853413-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.853828-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> sent request, body N 0
default	10:02:51.854007-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> received response, status 200 content K
default	10:02:51.854207-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> response ended
default	10:02:51.854254-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> done using Connection 10
default	10:02:51.854387-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> now using Connection 10
default	10:02:51.854760-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> summary for task success {transaction_duration_ms=609, response_status=200, connection=10, reused=1, request_start_ms=569, request_duration_ms=0, response_start_ms=608, response_duration_ms=0, request_bytes=244, response_bytes=2561, cache_hit=false}
default	10:02:51.854990-0500	RedLemon	Task <7DB60646-F5FB-4464-BBC7-2ECAB0D536BA>.<46> finished successfully
default	10:02:51.855110-0500	RedLemon	📡 Raw metadata response length: 2459 bytes
default	10:02:51.855262-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.855618-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> sent request, body N 0
default	10:02:51.855777-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.856229-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> received response, status 200 content K
default	10:02:51.856625-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> response ended
default	10:02:51.856688-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> done using Connection 8
default	10:02:51.856803-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> summary for task success {transaction_duration_ms=607, response_status=200, connection=8, reused=1, request_start_ms=575, request_duration_ms=0, response_start_ms=607, response_duration_ms=0, request_bytes=245, response_bytes=2620, cache_hit=false}
default	10:02:51.856831-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> now using Connection 8
default	10:02:51.857003-0500	RedLemon	Task <061EC62A-BFA4-44EE-9840-7FFCD9F3EF9B>.<49> finished successfully
default	10:02:51.857140-0500	RedLemon	📡 Raw metadata response length: 2518 bytes
default	10:02:51.857234-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> sent request, body N 0
default	10:02:51.857353-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.857983-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.861569-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> received response, status 200 content K
default	10:02:51.861917-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> response ended
default	10:02:51.861990-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> done using Connection 9
default	10:02:51.862133-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> now using Connection 9
default	10:02:51.862190-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> summary for task success {transaction_duration_ms=611, response_status=200, connection=9, reused=1, request_start_ms=582, request_duration_ms=0, response_start_ms=611, response_duration_ms=0, request_bytes=245, response_bytes=2301, cache_hit=false}
default	10:02:51.862389-0500	RedLemon	Task <11389B6F-9539-44FA-A030-D30C35E8F4AB>.<48> finished successfully
default	10:02:51.862560-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> sent request, body N 0
default	10:02:51.862569-0500	RedLemon	📡 Raw metadata response length: 2199 bytes
default	10:02:51.862714-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.863245-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.864442-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> received response, status 200 content K
default	10:02:51.864689-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> response ended
default	10:02:51.864850-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> done using Connection 12
default	10:02:51.865015-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> summary for task success {transaction_duration_ms=614, response_status=200, connection=12, reused=1, request_start_ms=583, request_duration_ms=0, response_start_ms=613, response_duration_ms=0, request_bytes=245, response_bytes=1994, cache_hit=false}
default	10:02:51.865036-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> now using Connection 12
default	10:02:51.865206-0500	RedLemon	Task <C555AAAD-6533-41D8-AF0D-C767439F9E09>.<50> finished successfully
default	10:02:51.865375-0500	RedLemon	📡 Raw metadata response length: 1892 bytes
default	10:02:51.865515-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.865808-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> sent request, body N 0
default	10:02:51.865986-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.886696-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> received response, status 200 content K
default	10:02:51.886934-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> response ended
default	10:02:51.886977-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> done using Connection 8
default	10:02:51.887196-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> now using Connection 8
default	10:02:51.887244-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> summary for task success {transaction_duration_ms=632, response_status=200, connection=8, reused=1, request_start_ms=601, request_duration_ms=0, response_start_ms=631, response_duration_ms=0, request_bytes=245, response_bytes=3074, cache_hit=false}
default	10:02:51.887407-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> received response, status 200 content K
default	10:02:51.887451-0500	RedLemon	Task <55F44F68-80B5-424A-9F72-D3A64416D390>.<54> finished successfully
default	10:02:51.887584-0500	RedLemon	📡 Raw metadata response length: 2972 bytes
default	10:02:51.887623-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> response ended
default	10:02:51.887737-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.887758-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> done using Connection 11
default	10:02:51.887887-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> now using Connection 11
default	10:02:51.888195-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> summary for task success {transaction_duration_ms=633, response_status=200, connection=11, reused=1, request_start_ms=599, request_duration_ms=0, response_start_ms=633, response_duration_ms=0, request_bytes=245, response_bytes=2035, cache_hit=false}
default	10:02:51.888286-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.888411-0500	RedLemon	Task <286FCD2C-3F27-4F7A-B35D-8CAAAA5401EC>.<53> finished successfully
default	10:02:51.888569-0500	RedLemon	📡 Raw metadata response length: 1933 bytes
default	10:02:51.888681-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> received response, status 200 content K
default	10:02:51.888773-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.889256-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.889266-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> response ended
default	10:02:51.889328-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> done using Connection 13
default	10:02:51.889484-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> now using Connection 13
default	10:02:51.889533-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> summary for task success {transaction_duration_ms=636, response_status=200, connection=13, reused=1, request_start_ms=592, request_duration_ms=0, response_start_ms=634, response_duration_ms=1, request_bytes=244, response_bytes=3020, cache_hit=false}
default	10:02:51.889727-0500	RedLemon	Task <B5934DBE-35E1-4C55-A4F0-E0665E382786>.<52> finished successfully
default	10:02:51.889944-0500	RedLemon	📡 Raw metadata response length: 2918 bytes
default	10:02:51.890099-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.890501-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> sent request, body N 0
default	10:02:51.890784-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.891202-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> sent request, body N 0
default	10:02:51.891702-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> sent request, body N 0
default	10:02:51.892374-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> received response, status 200 content K
default	10:02:51.893225-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> response ended
default	10:02:51.893296-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> done using Connection 10
default	10:02:51.893817-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> now using Connection 10
default	10:02:51.894067-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> summary for task success {transaction_duration_ms=639, response_status=200, connection=10, reused=1, request_start_ms=599, request_duration_ms=0, response_start_ms=637, response_duration_ms=1, request_bytes=245, response_bytes=2816, cache_hit=false}
default	10:02:51.894272-0500	RedLemon	Task <FDCE2424-E5E4-48BD-A9D3-64B9F05A3175>.<51> finished successfully
default	10:02:51.894375-0500	RedLemon	📡 Raw metadata response length: 2714 bytes
default	10:02:51.894531-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.895009-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> sent request, body N 0
default	10:02:51.895081-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.895582-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> received response, status 200 content K
default	10:02:51.895807-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> response ended
default	10:02:51.895854-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> done using Connection 9
default	10:02:51.896063-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> now using Connection 9
default	10:02:51.896208-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> summary for task success {transaction_duration_ms=639, response_status=200, connection=9, reused=1, request_start_ms=606, request_duration_ms=0, response_start_ms=639, response_duration_ms=0, request_bytes=245, response_bytes=2520, cache_hit=false}
default	10:02:51.896441-0500	RedLemon	Task <449D94CE-D816-479C-811F-B8168E895CA7>.<55> finished successfully
default	10:02:51.896573-0500	RedLemon	📡 Raw metadata response length: 2418 bytes
default	10:02:51.896836-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> sent request, body N 0
default	10:02:51.896796-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.897398-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.900194-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> received response, status 200 content K
default	10:02:51.900618-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> response ended
default	10:02:51.900692-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> done using Connection 12
default	10:02:51.900846-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> now using Connection 12
default	10:02:51.900888-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> summary for task success {transaction_duration_ms=643, response_status=200, connection=12, reused=1, request_start_ms=608, request_duration_ms=0, response_start_ms=642, response_duration_ms=0, request_bytes=245, response_bytes=2382, cache_hit=false}
default	10:02:51.901074-0500	RedLemon	Task <4A763C95-D569-4505-95E5-A0F0E6356253>.<56> finished successfully
default	10:02:51.901175-0500	RedLemon	📡 Raw metadata response length: 2280 bytes
default	10:02:51.901313-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.901597-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> sent request, body N 0
default	10:02:51.901848-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.924169-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> received response, status 200 content K
default	10:02:51.924557-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> response ended
default	10:02:51.924617-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> done using Connection 11
default	10:02:51.924761-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> now using Connection 11
default	10:02:51.927012-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> summary for task success {transaction_duration_ms=667, response_status=200, connection=11, reused=1, request_start_ms=631, request_duration_ms=0, response_start_ms=664, response_duration_ms=0, request_bytes=244, response_bytes=2354, cache_hit=false}
default	10:02:51.927334-0500	RedLemon	Task <D7AE1E28-E6DF-4662-B828-B98A6F72D733>.<58> finished successfully
default	10:02:51.927484-0500	RedLemon	📡 Raw metadata response length: 2252 bytes
default	10:02:51.927748-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	10:02:51.928400-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	10:02:51.929325-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> sent request, body N 0
default	10:02:51.932039-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> received response, status 200 content K
default	10:02:51.932475-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> response ended
default	10:02:51.932524-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> done using Connection 10
default	10:02:51.933901-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> now using Connection 10
default	10:02:51.934314-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> summary for task success {transaction_duration_ms=672, response_status=200, connection=10, reused=1, request_start_ms=631, request_duration_ms=0, response_start_ms=669, response_duration_ms=1, request_bytes=244, response_bytes=2181, cache_hit=false}
default	10:02:51.934521-0500	RedLemon	Task <A7D53ABB-FA12-47E1-8952-29095C929774>.<62> finished successfully
default	10:02:51.934676-0500	RedLemon	📡 Raw metadata response length: 2079 bytes
default	10:02:51.934822-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	10:02:51.935271-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	10:02:51.936036-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> received response, status 200 content K
default	10:02:51.937834-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> response ended
default	10:02:51.937899-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> done using Connection 13
default	10:02:51.938082-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> received response, status 200 content K
default	10:02:51.938242-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> response ended
default	10:02:51.938296-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> done using Connection 9
default	10:02:51.938421-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> now using Connection 13
default	10:02:51.938517-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> now using Connection 9
default	10:02:51.938935-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> summary for task success {transaction_duration_ms=677, response_status=200, connection=13, reused=1, request_start_ms=629, request_duration_ms=0, response_start_ms=674, response_duration_ms=2, request_bytes=245, response_bytes=2315, cache_hit=false}
default	10:02:51.939140-0500	RedLemon	Task <A3707B1F-40DD-4967-A9BA-CB84159C4A8D>.<59> finished successfully
default	10:02:51.939230-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> summary for task success {transaction_duration_ms=676, response_status=200, connection=9, reused=1, request_start_ms=633, request_duration_ms=0, response_start_ms=675, response_duration_ms=0, request_bytes=245, response_bytes=2367, cache_hit=false}
default	10:02:51.939299-0500	RedLemon	📡 Raw metadata response length: 2213 bytes
default	10:02:51.939383-0500	RedLemon	Task <6EA831A9-6CDE-4793-AF67-1D5F81162BA7>.<60> finished successfully
default	10:02:51.939444-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.939824-0500	RedLemon	📡 Raw metadata response length: 2265 bytes
default	10:02:51.939974-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.940196-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.940325-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.940716-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> sent request, body N 0
default	10:02:51.941200-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> sent request, body N 0
default	10:02:51.941487-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> sent request, body N 0
default	10:02:51.946085-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> received response, status 200 content K
default	10:02:51.946595-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> response ended
default	10:02:51.946645-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> done using Connection 8
default	10:02:51.947170-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> now using Connection 8
default	10:02:51.947360-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> summary for task success {transaction_duration_ms=688, response_status=200, connection=8, reused=1, request_start_ms=630, request_duration_ms=0, response_start_ms=686, response_duration_ms=1, request_bytes=245, response_bytes=2723, cache_hit=false}
default	10:02:51.947767-0500	RedLemon	Task <255AB10C-D0EB-43A1-817B-EB82FE0ACD15>.<57> finished successfully
default	10:02:51.948000-0500	RedLemon	📡 Raw metadata response length: 2621 bytes
default	10:02:51.948164-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.949069-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.947779-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> received response, status 200 content K
default	10:02:51.949749-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> response ended
default	10:02:51.949800-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> done using Connection 12
default	10:02:51.949937-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> now using Connection 12
default	10:02:51.950798-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> summary for task success {transaction_duration_ms=688, response_status=200, connection=12, reused=1, request_start_ms=638, request_duration_ms=0, response_start_ms=684, response_duration_ms=2, request_bytes=245, response_bytes=2510, cache_hit=false}
default	10:02:51.951441-0500	RedLemon	Task <D9B573BF-041B-47B7-871C-BC6210FC4349>.<61> finished successfully
default	10:02:51.951919-0500	RedLemon	📡 Raw metadata response length: 2408 bytes
default	10:02:51.952081-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.952640-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.953284-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> sent request, body N 0
default	10:02:51.953583-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> sent request, body N 0
default	10:02:51.957954-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> received response, status 200 content K
default	10:02:51.958285-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> response ended
default	10:02:51.958333-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> done using Connection 11
default	10:02:51.958461-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> now using Connection 11
default	10:02:51.958774-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> sent request, body N 0
default	10:02:51.958862-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> summary for task success {transaction_duration_ms=693, response_status=200, connection=11, reused=1, request_start_ms=664, request_duration_ms=0, response_start_ms=692, response_duration_ms=0, request_bytes=245, response_bytes=3022, cache_hit=false}
default	10:02:51.959050-0500	RedLemon	Task <5A1539E8-FE02-42FD-BA74-15B34F32C7EA>.<64> finished successfully
default	10:02:51.959172-0500	RedLemon	📡 Raw metadata response length: 2920 bytes
default	10:02:51.959638-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.960629-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.975589-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> received response, status 200 content K
default	10:02:51.976196-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> response ended
default	10:02:51.976288-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> done using Connection 9
default	10:02:51.976624-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> summary for task success {transaction_duration_ms=710, response_status=200, connection=9, reused=1, request_start_ms=674, request_duration_ms=0, response_start_ms=709, response_duration_ms=0, request_bytes=244, response_bytes=2104, cache_hit=false}
default	10:02:51.976671-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> received response, status 200 content K
default	10:02:51.977178-0500	RedLemon	Task <B6FED71F-23CE-443A-8B33-A33F5B217C5A>.<66> finished successfully
default	10:02:51.977344-0500	RedLemon	📡 Raw metadata response length: 2002 bytes
default	10:02:51.977581-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:51.978321-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:51.979111-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> response ended
default	10:02:51.979264-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> done using Connection 13
default	10:02:51.979660-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> now using Connection 9
default	10:02:51.979959-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> now using Connection 13
default	10:02:51.980091-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> summary for task success {transaction_duration_ms=714, response_status=200, connection=13, reused=1, request_start_ms=675, request_duration_ms=0, response_start_ms=711, response_duration_ms=3, request_bytes=244, response_bytes=2714, cache_hit=false}
default	10:02:51.980674-0500	RedLemon	Task <FF0734BC-33A9-42B2-9FBD-4975BE8AFE20>.<65> finished successfully
default	10:02:51.980882-0500	RedLemon	📡 Raw metadata response length: 2612 bytes
default	10:02:51.981030-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	10:02:51.981748-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	10:02:51.982664-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> sent request, body N 0
default	10:02:51.990201-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> sent request, body N 0
default	10:02:51.990545-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> received response, status 200 content K
default	10:02:51.991025-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> response ended
default	10:02:51.991074-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> done using Connection 10
default	10:02:51.994079-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> summary for task success {transaction_duration_ms=728, response_status=200, connection=10, reused=1, request_start_ms=673, request_duration_ms=1, response_start_ms=725, response_duration_ms=0, request_bytes=244, response_bytes=2807, cache_hit=false}
default	10:02:51.994450-0500	RedLemon	Task <6398ACA8-7FD5-4D0E-8F00-EE7790579F26>.<63> finished successfully
default	10:02:51.994560-0500	RedLemon	📡 Raw metadata response length: 2705 bytes
default	10:02:51.994848-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	10:02:51.991206-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> now using Connection 10
default	10:02:51.995935-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	10:02:51.998408-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> sent request, body N 0
default	10:02:51.998560-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> received response, status 200 content K
default	10:02:52.001419-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> response ended
default	10:02:52.001588-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> done using Connection 8
default	10:02:52.001779-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> received response, status 200 content K
default	10:02:52.001816-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> summary for task success {transaction_duration_ms=734, response_status=200, connection=8, reused=1, request_start_ms=685, request_duration_ms=0, response_start_ms=730, response_duration_ms=3, request_bytes=245, response_bytes=2621, cache_hit=false}
default	10:02:52.002410-0500	RedLemon	Task <7A2B80DF-FAEF-4B3E-8328-CAFAF0396117>.<67> finished successfully
default	10:02:52.002644-0500	RedLemon	📡 Raw metadata response length: 2519 bytes
default	10:02:52.002800-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.003577-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.005304-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> response ended
default	10:02:52.005378-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> done using Connection 12
default	10:02:52.006231-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> now using Connection 8
default	10:02:52.006524-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> now using Connection 12
default	10:02:52.007355-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> summary for task success {transaction_duration_ms=739, response_status=200, connection=12, reused=1, request_start_ms=685, request_duration_ms=0, response_start_ms=733, response_duration_ms=4, request_bytes=244, response_bytes=3014, cache_hit=false}
default	10:02:52.007824-0500	RedLemon	Task <EBBB4494-6EA4-44EA-95D0-481D10E3A182>.<68> finished successfully
default	10:02:52.007880-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> sent request, body N 0
default	10:02:52.008032-0500	RedLemon	📡 Raw metadata response length: 2912 bytes
default	10:02:52.008474-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.009320-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.010706-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> sent request, body N 0
default	10:02:52.010855-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> received response, status 200 content K
default	10:02:52.015825-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> response ended
default	10:02:52.017241-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> done using Connection 11
default	10:02:52.017499-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> now using Connection 11
default	10:02:52.018151-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> summary for task success {transaction_duration_ms=749, response_status=200, connection=11, reused=1, request_start_ms=689, request_duration_ms=0, response_start_ms=741, response_duration_ms=6, request_bytes=245, response_bytes=2424, cache_hit=false}
default	10:02:52.018361-0500	RedLemon	Task <DD76DC4A-A75D-4CC2-8CED-38CC13EA3DE2>.<70> finished successfully
default	10:02:52.018496-0500	RedLemon	📡 Raw metadata response length: 2322 bytes
default	10:02:52.018671-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.019478-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.018409-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> sent request, body N 0
default	10:02:52.022551-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> received response, status 200 content K
default	10:02:52.023058-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> response ended
default	10:02:52.023144-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> done using Connection 9
default	10:02:52.023369-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> now using Connection 9
default	10:02:52.024832-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> summary for task success {transaction_duration_ms=755, response_status=200, connection=9, reused=1, request_start_ms=712, request_duration_ms=0, response_start_ms=752, response_duration_ms=0, request_bytes=244, response_bytes=2405, cache_hit=false}
default	10:02:52.025409-0500	RedLemon	Task <555E89A2-CD21-4457-84FF-D1B8524BBA51>.<69> finished successfully
default	10:02:52.026077-0500	RedLemon	📡 Raw metadata response length: 2303 bytes
default	10:02:52.026465-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	10:02:52.027231-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	10:02:52.026171-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> sent request, body N 0
default	10:02:52.031145-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> received response, status 200 content K
default	10:02:52.034627-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> response ended
default	10:02:52.034745-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> done using Connection 13
default	10:02:52.034976-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> now using Connection 13
default	10:02:52.035444-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> sent request, body N 0
default	10:02:52.035770-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> received response, status 200 content K
default	10:02:52.036010-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> summary for task success {transaction_duration_ms=764, response_status=200, connection=13, reused=1, request_start_ms=719, request_duration_ms=0, response_start_ms=759, response_duration_ms=3, request_bytes=244, response_bytes=3173, cache_hit=false}
default	10:02:52.036416-0500	RedLemon	Task <7DBF851B-FD58-48E8-8514-455750503E7E>.<72> finished successfully
default	10:02:52.036658-0500	RedLemon	📡 Raw metadata response length: 3071 bytes
default	10:02:52.036170-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> response ended
default	10:02:52.036812-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> done using Connection 10
default	10:02:52.036911-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.037516-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> now using Connection 10
default	10:02:52.037594-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.041299-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> sent request, body N 0
default	10:02:52.041465-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> summary for task success {transaction_duration_ms=768, response_status=200, connection=10, reused=1, request_start_ms=725, request_duration_ms=0, response_start_ms=762, response_duration_ms=1, request_bytes=245, response_bytes=2006, cache_hit=false}
default	10:02:52.041749-0500	RedLemon	Task <08D6D106-E1F1-40A0-B01F-04CD83166E2B>.<74> finished successfully
default	10:02:52.041870-0500	RedLemon	📡 Raw metadata response length: 1904 bytes
default	10:02:52.042037-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.042521-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.044403-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> received response, status 200 content K
default	10:02:52.045185-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> response ended
default	10:02:52.045248-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> done using Connection 11
default	10:02:52.045373-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> summary for task success {transaction_duration_ms=769, response_status=200, connection=11, reused=1, request_start_ms=742, request_duration_ms=0, response_start_ms=768, response_duration_ms=1, request_bytes=244, response_bytes=2428, cache_hit=false}
default	10:02:52.045387-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> now using Connection 11
default	10:02:52.045569-0500	RedLemon	Task <DB5C00C2-337F-4B5F-85D0-9DDBEC973822>.<77> finished successfully
default	10:02:52.045696-0500	RedLemon	📡 Raw metadata response length: 2326 bytes
default	10:02:52.045974-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.046243-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> received response, status 200 content K
default	10:02:52.046578-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> response ended
default	10:02:52.046576-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.046629-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> done using Connection 8
default	10:02:52.046812-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> summary for task success {transaction_duration_ms=773, response_status=200, connection=8, reused=1, request_start_ms=734, request_duration_ms=0, response_start_ms=772, response_duration_ms=1, request_bytes=244, response_bytes=2537, cache_hit=false}
default	10:02:52.047003-0500	RedLemon	Task <9CAE7C89-129F-4E69-8738-8E3B1EA3E65C>.<73> finished successfully
default	10:02:52.047210-0500	RedLemon	📡 Raw metadata response length: 2435 bytes
default	10:02:52.047524-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.048136-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.048469-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> sent request, body N 0
default	10:02:52.048743-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> received response, status 200 content K
default	10:02:52.049345-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> response ended
default	10:02:52.049458-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> done using Connection 12
default	10:02:52.049587-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> summary for task success {transaction_duration_ms=776, response_status=200, connection=12, reused=1, request_start_ms=736, request_duration_ms=0, response_start_ms=775, response_duration_ms=0, request_bytes=245, response_bytes=2598, cache_hit=false}
default	10:02:52.049782-0500	RedLemon	Task <9EDA7F60-D365-44D7-B377-DCDA0AE3C2BC>.<71> finished successfully
default	10:02:52.049967-0500	RedLemon	📡 Raw metadata response length: 2496 bytes
default	10:02:52.050194-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.050688-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.062619-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> received response, status 200 content K
default	10:02:52.062858-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> response ended
default	10:02:52.062902-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> done using Connection 9
default	10:02:52.063009-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> summary for task success {transaction_duration_ms=787, response_status=200, connection=9, reused=1, request_start_ms=749, request_duration_ms=0, response_start_ms=786, response_duration_ms=0, request_bytes=245, response_bytes=2285, cache_hit=false}
default	10:02:52.063196-0500	RedLemon	Task <3AB7167C-70F6-45E2-AB45-DF84E0F47222>.<75> finished successfully
default	10:02:52.063328-0500	RedLemon	📡 Raw metadata response length: 2183 bytes
default	10:02:52.063469-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.064166-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.066042-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> received response, status 200 content K
default	10:02:52.066304-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> response ended
default	10:02:52.066379-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> done using Connection 13
default	10:02:52.066504-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> summary for task success {transaction_duration_ms=790, response_status=200, connection=13, reused=1, request_start_ms=759, request_duration_ms=0, response_start_ms=789, response_duration_ms=0, request_bytes=245, response_bytes=2588, cache_hit=false}
default	10:02:52.066685-0500	RedLemon	Task <4D28E023-D3A6-4B2F-B301-4A1CC8324DDC>.<76> finished successfully
default	10:02:52.066828-0500	RedLemon	📡 Raw metadata response length: 2486 bytes
default	10:02:52.066977-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.067589-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.070228-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> received response, status 200 content K
default	10:02:52.070456-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> response ended
default	10:02:52.070504-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> done using Connection 10
default	10:02:52.070653-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> summary for task success {transaction_duration_ms=794, response_status=200, connection=10, reused=1, request_start_ms=761, request_duration_ms=3, response_start_ms=793, response_duration_ms=0, request_bytes=244, response_bytes=2466, cache_hit=false}
default	10:02:52.070884-0500	RedLemon	Task <E6626260-1A8E-486E-9FF1-49ED328428C6>.<78> finished successfully
default	10:02:52.071099-0500	RedLemon	📡 Raw metadata response length: 2364 bytes
default	10:02:52.071609-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.072236-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.078459-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> received response, status 200 content K
default	10:02:52.078727-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> response ended
default	10:02:52.078774-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> done using Connection 11
default	10:02:52.078877-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> summary for task success {transaction_duration_ms=802, response_status=200, connection=11, reused=1, request_start_ms=770, request_duration_ms=0, response_start_ms=801, response_duration_ms=0, request_bytes=245, response_bytes=2594, cache_hit=false}
default	10:02:52.079052-0500	RedLemon	Task <B79759F8-837E-4BBE-A8E2-514E32E96C85>.<79> finished successfully
default	10:02:52.079211-0500	RedLemon	📡 Raw metadata response length: 2492 bytes
default	10:02:52.079355-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	10:02:52.079871-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	10:02:52.080406-0500	RedLemon	✅ [Admin] Final list contains 54 movies:
default	10:02:52.080617-0500	RedLemon	   1. Primitive War (ID: tt18312380)
default	10:02:52.080760-0500	RedLemon	   2. The Family Plan 2 (ID: tt34276058)
default	10:02:52.080900-0500	RedLemon	   3. High Forces (ID: tt17501870)
default	10:02:52.081033-0500	RedLemon	   4. Bureau 749 (ID: tt10210064)
default	10:02:52.081213-0500	RedLemon	   5. The Long Walk (ID: tt10374610)
default	10:02:52.081368-0500	RedLemon	   6. Wildcat (ID: tt36153493)
default	10:02:52.081619-0500	RedLemon	   7. Predator: Badlands (ID: tt31227572)
default	10:02:52.081883-0500	RedLemon	   8. Shahenshah (ID: tt0093949)
default	10:02:52.082056-0500	RedLemon	   9. Laila (ID: tt32831759)
default	10:02:52.082210-0500	RedLemon	   10. The Conjuring: Last Rites (ID: tt22898462)
default	10:02:52.082354-0500	RedLemon	   11. Captain Hook: The Cursed Tides (ID: tt33458086)
default	10:02:52.082489-0500	RedLemon	   12. Monster Island (ID: tt29262075)
default	10:02:52.082664-0500	RedLemon	   13. Interstellar (ID: tt0816692)
default	10:02:52.082880-0500	RedLemon	   14. Five Nights at Freddy's 2 (ID: tt30274401)
default	10:02:52.083209-0500	RedLemon	   15. Succubus (ID: tt13778486)
default	10:02:52.083435-0500	RedLemon	   16. Sisu: Road to Revenge (ID: tt31844586)
default	10:02:52.083581-0500	RedLemon	   17. Avatar: Fire and Ash (ID: tt1757678)
default	10:02:52.083714-0500	RedLemon	   18. Code 3 (ID: tt26394837)
default	10:02:52.083842-0500	RedLemon	   19. Prep & Landing: The Snowball Protocol (ID: tt32594892)
default	10:02:52.083987-0500	RedLemon	   20. One Battle After Another (ID: tt30144839)
default	10:02:52.084156-0500	RedLemon	   21. Martin (ID: tt15334030)
default	10:02:52.084294-0500	RedLemon	   22. Wake Up Dead Man: A Knives Out Mystery (ID: tt14364480)
default	10:02:52.084425-0500	RedLemon	   23. Avatar: The Way of Water (ID: tt1630029)
default	10:02:52.084638-0500	RedLemon	   24. High Ground (ID: tt35669717)
default	10:02:52.084913-0500	RedLemon	   25. The Shadow's Edge (ID: tt34610311)
default	10:02:52.085078-0500	RedLemon	   26. She Rides Shotgun (ID: tt27986457)
default	10:02:52.085218-0500	RedLemon	   27. The Running Man (ID: tt14107334)
default	10:02:52.085346-0500	RedLemon	   28. Nobody 2 (ID: tt28996126)
default	10:02:52.085474-0500	RedLemon	   29. Zootopia 2 (ID: tt26443597)
default	10:02:52.085604-0500	RedLemon	   30. The Bad Guys 2 (ID: tt30017619)
default	10:02:52.085732-0500	RedLemon	   31. Demon Slayer: Kimetsu no Yaiba- The Movie - Infinity Castle (ID: tt32820897)
default	10:02:52.085858-0500	RedLemon	   32. Stand Your Ground (ID: tt30826955)
default	10:02:52.085984-0500	RedLemon	   33. The Prosecutor (ID: tt30024043)
default	10:02:52.086110-0500	RedLemon	   34. Playdate (ID: tt31425731)
default	10:02:52.086246-0500	RedLemon	   35. Chainsaw Man - The Movie: Reze Arc (ID: tt30472557)
default	10:02:52.086380-0500	RedLemon	   36. A Legend (ID: tt27589902)
default	10:02:52.086631-0500	RedLemon	   37. Ya No Quedan Junglas (ID: tt32140922)
default	10:02:52.086791-0500	RedLemon	   38. Zootopia (ID: tt2948356)
default	10:02:52.086937-0500	RedLemon	   39. Stolen Girl (ID: tt4682810)
default	10:02:52.087069-0500	RedLemon	   40. The Strangers: Chapter 2 (ID: tt28671344)
default	10:02:52.087198-0500	RedLemon	   41. Operation Blood Hunt (ID: tt23553640)
default	10:02:52.087322-0500	RedLemon	   42. xXx (ID: tt0295701)
default	10:02:52.087455-0500	RedLemon	   43. F1: The Movie (ID: tt16311594)
default	10:02:52.087584-0500	RedLemon	   44. Black Phone 2 (ID: tt29644189)
default	10:02:52.087711-0500	RedLemon	   45. Art of Eight Limbs (ID: tt10079652)
default	10:02:52.087877-0500	RedLemon	   46. Roofman (ID: tt4627382)
default	10:02:52.088043-0500	RedLemon	   47. How to Train Your Dragon (ID: tt26743210)
default	10:02:52.088192-0500	RedLemon	   48. The Avengers (ID: tt0848228)
default	10:02:52.088352-0500	RedLemon	   49. Now You See Me: Now You Don't (ID: tt4712810)
default	10:02:52.088510-0500	RedLemon	   50. Lilo & Stitch (ID: tt11655566)
default	10:02:52.088648-0500	RedLemon	   51. Predator (ID: tt0093773)
default	10:02:52.088778-0500	RedLemon	   52. Troll (ID: tt11116912)
default	10:02:52.088903-0500	RedLemon	   53. Six jours (ID: tt29610108)
default	10:02:52.089040-0500	RedLemon	   54. Elio (ID: tt4900148)
default	10:02:52.089266-0500	RedLemon	📤 [Admin] Persisting 24 exclusions: ["tt29567915", "tt0468569", "tt1302067", "tt14205554", "tt29615160", "tt6604188", "tt7349950", "tt26920256", "tt23050520", "tt12300742", "tt16431870", "tt28293853", "tt9603208", "tt29468874", "tt14999684", "tt13186306", "tt31434030", "tt1527793", "tt2803854", "tt10676052", "tt1312221", "tt32565484", "tt32123395", "tt31036941"]
default	10:02:52.089555-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:02:52.089960-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0FD793ED-1EA4-454A-8B2A-91DE5531BD05] (reporting strategy default)> on Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> was not selected for reporting
default	10:02:52.090495-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:52.090697-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> now using Connection 1
default	10:02:52.091021-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> sent request, body N 0
default	10:02:52.167520-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> received response, status 200 content U
default	10:02:52.169066-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> done using Connection 1
default	10:02:52.169182-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> response ended
default	10:02:52.169409-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> summary for task success {transaction_duration_ms=79, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=77, response_duration_ms=1, request_bytes=269, response_bytes=8901, cache_hit=false}
default	10:02:52.169594-0500	RedLemon	Task <481AE46A-568A-4B23-82FE-27137703C491>.<29> finished successfully
default	10:02:52.171502-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):31623] from originator [anon<RedLemon>(501):31623] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:170-31623-2665 target:31623 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:02:52.171991-0500	runningboardd	Assertion 170-31623-2665 (target:[anon<RedLemon>(501):31623]) will be created as active as no start-time-defining assertions exist
default	10:02:52.182466-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:02:52.183038-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6D73241B-9A40-4ACC-BF0A-27D2F5FC809A] (reporting strategy default)> on Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> was not selected for reporting
default	10:02:52.183685-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:52.184221-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> now using Connection 1
default	10:02:52.185612-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> sent request, body S 31946
default	10:02:52.191045-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:02:52.191219-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:02:52.191351-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed
default	10:02:52.196099-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):31623] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:170-103-2666 target:31623 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:02:52.196362-0500	runningboardd	Assertion 170-103-2666 (target:[anon<RedLemon>(501):31623]) will be created as active
default	10:02:52.200537-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:02:52.200640-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:02:52.200881-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed
default	10:02:52.313889-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> received response, status 201 content U
default	10:02:52.315279-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> done using Connection 1
default	10:02:52.315522-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> response ended
default	10:02:52.315676-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> summary for task success {transaction_duration_ms=132, response_status=201, connection=1, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=130, response_duration_ms=1, request_bytes=32181, response_bytes=8836, cache_hit=false}
default	10:02:52.315860-0500	RedLemon	Task <C867171F-163B-4EA1-A754-D5C23F525DFD>.<30> finished successfully
default	10:02:52.361885-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:02:52.362518-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [69DAA592-8B55-4E38-B7E0-81FE04E54199] (reporting strategy default)> on Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> was not selected for reporting
default	10:02:52.363079-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:02:52.363260-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> now using Connection 1
default	10:02:52.363487-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> sent request, body N 0
default	10:02:52.433029-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> received response, status 200 content U
default	10:02:52.434787-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> done using Connection 1
default	10:02:52.434895-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> response ended
default	10:02:52.435017-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=70, response_duration_ms=2, request_bytes=269, response_bytes=9038, cache_hit=false}
default	10:02:52.435199-0500	RedLemon	Task <EB313BDF-5F64-4634-AF54-EC1A14024E3D>.<31> finished successfully
default	10:02:52.442935-0500	RedLemon	✅ [ScheduleManagement] Refreshed data. Loaded 54 movies. Version: 62
default	10:02:53.306073-0500	runningboardd	Invalidating assertion 170-31623-2665 (target:[anon<RedLemon>(501):31623]) from originator [anon<RedLemon>(501):31623]
default	10:02:53.480659-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:02:53.480714-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:02:53.480767-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed
default	10:02:53.481682-0500	runningboardd	Invalidating assertion 170-103-2666 (target:[anon<RedLemon>(501):31623]) from originator [daemon<com.apple.powerd>:103]
default	10:02:53.593719-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:02:53.593761-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:02:53.593803-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed
default	10:03:08.636440-0500	runningboardd	Invalidating assertion 170-129-2657 (target:[anon<RedLemon>(501):31623]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	10:03:08.744271-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring jetsam update because this process is not memory-managed
default	10:03:08.744381-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring suspend because this process is not lifecycle managed
default	10:03:08.744447-0500	runningboardd	[anon<RedLemon>(501):31623] Set darwin role to: UserInteractiveNonFocal
default	10:03:08.744596-0500	runningboardd	[anon<RedLemon>(501):31623] Ignoring GPU update because this process is not GPU managed








