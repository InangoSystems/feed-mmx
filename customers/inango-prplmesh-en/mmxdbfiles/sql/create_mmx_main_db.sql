-- ***********************************************************
-- Information table for object Device.
-- ***********************************************************
DROP TABLE IF EXISTS Device_ValuesTbl; 
CREATE TABLE Device_ValuesTbl
(
    [RootDataModelVersion]    TEXT DEFAULT "2.7",
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0
);


-- ***********************************************************
-- Information table for object Device.X_Inango_MMXSettings.
-- ***********************************************************
DROP TABLE IF EXISTS Device_X_Inango_MMXSettings_ValuesTbl; 
CREATE TABLE Device_X_Inango_MMXSettings_ValuesTbl
(
    [SaveConfig]    INTEGER DEFAULT 0,
    [RestoreConfig]    INTEGER DEFAULT 0,
    [RefreshData]    INTEGER DEFAULT 0,
    [Reboot]    INTEGER DEFAULT 0,
    [FactoryReset]    INTEGER DEFAULT 0,
    [FactoryResetKeepConn]    INTEGER DEFAULT 0,
    [Shutdown]    INTEGER DEFAULT 0,
    [CreateCandidateConfig]    INTEGER DEFAULT 0,
    [CommitCandidateConfig]    INTEGER DEFAULT 0,
    [ResetCandidateConfig]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_ValuesTbl
(
    [ID]    TEXT,
    [NumberOfDevices]    INTEGER DEFAULT 0,
    [ControllerID]    TEXT,
    [TimeStamp]    TEXT,
    [NumberOfAccessPoints]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.AccessPoint.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl
(
    [AccessPointIndex]     INTEGER,
    [SSID]    TEXT DEFAULT "prplMesh",
    [MultiApMode]    TEXT DEFAULT "Fronthaul" CHECK (MultiApMode IN ("Fronthaul", "Backhaul", "Fronthaul+Backhaul")),
    [Band2_4G]    INTEGER DEFAULT 0,
    [Band5GL]    INTEGER DEFAULT 0,
    [Band5GH]    INTEGER DEFAULT 0,
    [Band6G]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([AccessPointIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.AccessPoint.{i}.Security.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_AccessPoint_Security_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_AccessPoint_Security_ValuesTbl
(
    [AccessPointIndex]     INTEGER,
    [ModeEnabled]    TEXT DEFAULT "None" CHECK (ModeEnabled IN ("WPA2-Personal", "WPA3-Personal", "None")),
    [PreSharedKey]    TEXT,
    [KeyPassphrase]    TEXT,
    [SAEPassphrase]    TEXT,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([AccessPointIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [ID]    TEXT DEFAULT "00:00:00:00:00:00",
    [CollectionInterval]    INTEGER DEFAULT 0,
    [NumberOfRadios]    INTEGER DEFAULT 0,
    [NumberOfInterfaces]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Interface.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [InterfaceIndex]     INTEGER,
    [NumberOfNeighbors]    INTEGER DEFAULT 0,
    [Status]    TEXT DEFAULT "Down",
    [MACAddress]    TEXT DEFAULT "00:00:00:00:00:00",
    [Name]    TEXT DEFAULT "NoName",
    [MediaType]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[InterfaceIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Interface.{i}.Stats.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Interface_Stats_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Interface_Stats_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [InterfaceIndex]     INTEGER,
    [BytesSent]    INTEGER DEFAULT 0,
    [BytesReceived]    INTEGER DEFAULT 0,
    [PacketsSent]    INTEGER DEFAULT 0,
    [PacketsReceived]    INTEGER DEFAULT 0,
    [ErrorsSent]    INTEGER DEFAULT 0,
    [ErrorsReceived]    INTEGER DEFAULT 0,
    [UnicastPacketsSent]    INTEGER DEFAULT 0,
    [UnicastPacketsReceived]    INTEGER DEFAULT 0,
    [DiscardPacketsSent]    INTEGER DEFAULT 0,
    [DiscardPacketsReceived]    INTEGER DEFAULT 0,
    [MulticastPacketsSent]    INTEGER DEFAULT 0,
    [MulticastPacketsReceived]    INTEGER DEFAULT 0,
    [BroadcastPacketsSent]    INTEGER DEFAULT 0,
    [BroadcastPacketsReceived]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[InterfaceIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Interface.{i}.Neighbor.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [InterfaceIndex]     INTEGER,
    [NeighborIndex]     INTEGER,
    [ID]    TEXT DEFAULT "00:00:00:00:00:00",
    [IsIEEE1905]    INTEGER DEFAULT 0,
    [NumberOfNeighbors]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[InterfaceIndex],[NeighborIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [ID]    TEXT DEFAULT "00:00:00:00:00:00",
    [Enabled]    INTEGER DEFAULT 0,
    [Noise]    INTEGER DEFAULT 0,
    [Utilization]    INTEGER DEFAULT 0,
    [Transmit]    INTEGER DEFAULT 0,
    [ReceiveSelf]    INTEGER DEFAULT 0,
    [ReceiveOther]    INTEGER DEFAULT 0,
    [NumberOfCurrOpClass]    INTEGER DEFAULT 0,
    [NumberOfBSS]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.CurrentOperatingClasses.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [CurrentOperatingClassesIndex]     INTEGER,
    [TimeStamp]    TEXT DEFAULT "2020-08-31T11:22:39Z",
    [Class]    INTEGER DEFAULT 0,
    [Channel]    INTEGER DEFAULT 0,
    [TxPower]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[CurrentOperatingClassesIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.Capabilities.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_Capabilities_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [NumberOfOperatingClasses]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.Capabilities.HTCapabilities.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_Capabilities_HTCapabilities_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_HTCapabilities_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [tx_spatial_streams]    INTEGER DEFAULT 0,
    [rx_spatial_streams]    INTEGER DEFAULT 0,
    [HT_40_Mhz]    INTEGER DEFAULT 0,
    [GI_20_MHz]    INTEGER DEFAULT 0,
    [GI_40_MHz]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.Capabilities.VHTCapabilities.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_Capabilities_VHTCapabilities_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_VHTCapabilities_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [VHT_Tx_MCS]    INTEGER DEFAULT 0,
    [VHT_Rx_MCS]    INTEGER DEFAULT 0,
    [tx_spatial_streams]    INTEGER DEFAULT 0,
    [rx_spatial_streams]    INTEGER DEFAULT 0,
    [GI_80_MHz]    INTEGER DEFAULT 0,
    [GI_160_MHz]    INTEGER DEFAULT 0,
    [VHT_80_80_MHz]    INTEGER DEFAULT 0,
    [VHT_160_MHz]    INTEGER DEFAULT 0,
    [SU_beamformer]    INTEGER DEFAULT 0,
    [MU_beamformer]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClasses.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OperatingClassesIndex]     INTEGER,
    [Class]    INTEGER DEFAULT 0,
    [MaxTxPower]    INTEGER DEFAULT 0,
    [NumberOfNonOperChan]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OperatingClassesIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClasses.{i}.NonOperable.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OperatingClassesIndex]     INTEGER,
    [NonOperableIndex]     INTEGER,
    [NonOpChannelNumber]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OperatingClassesIndex],[NonOperableIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.BSS.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [BSSIndex]     INTEGER,
    [BSSID]    TEXT DEFAULT "00:00:00:00:00:00",
    [SSID]    TEXT DEFAULT "0",
    [Enabled]    INTEGER DEFAULT 0,
    [LastChange]    INTEGER DEFAULT 0,
    [TimeStamp]    TEXT DEFAULT "2020-08-31T11:22:39Z",
    [UnicastBytesSent]    INTEGER DEFAULT 0,
    [UnicastBytesReceived]    INTEGER DEFAULT 0,
    [MulticastBytesSent]    INTEGER DEFAULT 0,
    [MulticastBytesReceived]    INTEGER DEFAULT 0,
    [BroadcastBytesSent]    INTEGER DEFAULT 0,
    [BroadcastBytesReceived]    INTEGER DEFAULT 0,
    [EstServiceParametersBE]    INTEGER DEFAULT 0,
    [EstServiceParametersBK]    INTEGER DEFAULT 0,
    [EstServiceParametersVI]    INTEGER DEFAULT 0,
    [EstServiceParametersVO]    INTEGER DEFAULT 0,
    [NumberOfSTA]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[BSSIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.BSS.{i}.STA.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [BSSIndex]     INTEGER,
    [STAIndex]     INTEGER,
    [MACAddress]    TEXT DEFAULT "00:00:00:00:00:00",
    [TimeStamp]    TEXT DEFAULT "2020-08-31T11:22:39Z",
    [LastDataDownlinkRate]    INTEGER DEFAULT 0,
    [LastDataUplinkRate]    INTEGER DEFAULT 0,
    [UtilizationReceive]    INTEGER DEFAULT 0,
    [UtilizationTransmit]    INTEGER DEFAULT 0,
    [EstMACDataRateDownlink]    INTEGER DEFAULT 0,
    [EstMACDataRateUplink]    INTEGER DEFAULT 0,
    [SignalStrength]    INTEGER DEFAULT 0,
    [LastConnectTime]    INTEGER DEFAULT 0,
    [BytesSent]    INTEGER DEFAULT 0,
    [BytesReceived]    INTEGER DEFAULT 0,
    [PacketsSent]    INTEGER DEFAULT 0,
    [PacketsReceived]    INTEGER DEFAULT 0,
    [ErrorsSent]    INTEGER DEFAULT 0,
    [ErrorsReceived]    INTEGER DEFAULT 0,
    [RetransCount]    INTEGER DEFAULT 0,
    [IPV4Address]    TEXT DEFAULT "0",
    [IPV6Address]    TEXT DEFAULT "0",
    [Hostname]    TEXT DEFAULT "0",
    [NumberOfMeasureReports]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[BSSIndex],[STAIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.BackhaulSTA.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_BackhaulSTA_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_BackhaulSTA_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [MACAddress]    TEXT DEFAULT "00:00:00:00:00:00",
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.ScanResult.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_ScanResult_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [NumberOfOpClassScans]    INTEGER DEFAULT 0,
    [TimeStamp]    TEXT DEFAULT "0",
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OpClassScanIndex]     INTEGER,
    [NumberOfChannelScans]    INTEGER DEFAULT 0,
    [OperatingClass]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OpClassScanIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OpClassScanIndex]     INTEGER,
    [ChannelScanIndex]     INTEGER,
    [Channel]    INTEGER DEFAULT 0,
    [TimeStamp]    TEXT DEFAULT "0",
    [Utilization]    INTEGER DEFAULT 0,
    [Noise]    INTEGER DEFAULT 0,
    [NumberOfNeighbors]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OpClassScanIndex],[ChannelScanIndex])
);


-- ***********************************************************
-- Information table for object Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl; 
CREATE TABLE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OpClassScanIndex]     INTEGER,
    [ChannelScanIndex]     INTEGER,
    [NeighborBSSIndex]     INTEGER,
    [BSSID]    TEXT DEFAULT "0",
    [SSID]    TEXT DEFAULT "0",
    [SignalStrength]    INTEGER DEFAULT 0,
    [ChannelBandwidth]    INTEGER DEFAULT 0,
    [ChannelUtilization]    INTEGER DEFAULT 0,
    [StationCount]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OpClassScanIndex],[ChannelScanIndex],[NeighborBSSIndex])
);


-- *********************************************************** 
-- Triggers for table Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_insert];
CREATE TRIGGER [tr_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl]
BEGIN 
   INSERT INTO [Device_WiFi_DataElements_Network_AccessPoint_Security_ValuesTbl] ([AccessPointIndex]) 
       VALUES (NEW.[AccessPointIndex]) ;
END;

DROP TRIGGER IF EXISTS [tr_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_delete];
CREATE TRIGGER [tr_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl]
BEGIN 
   DELETE FROM [Device_WiFi_DataElements_Network_AccessPoint_Security_ValuesTbl] 
       WHERE  [AccessPointIndex] = OLD.[AccessPointIndex] ;
END;


-- *********************************************************** 
-- Triggers for table Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_insert];
CREATE TRIGGER [tr_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl]
BEGIN 
   INSERT INTO [Device_WiFi_DataElements_Network_Device_Interface_Stats_ValuesTbl] ([DeviceIndex], [InterfaceIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[InterfaceIndex]) ;
END;

DROP TRIGGER IF EXISTS [tr_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_delete];
CREATE TRIGGER [tr_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl]
BEGIN 
   DELETE FROM [Device_WiFi_DataElements_Network_Device_Interface_Stats_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [InterfaceIndex] = OLD.[InterfaceIndex] ;
END;


-- *********************************************************** 
-- Triggers for table Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_insert];
CREATE TRIGGER [tr_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl]
BEGIN 
   INSERT INTO [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_ValuesTbl] ([DeviceIndex], [RadioIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[RadioIndex]) ;
   INSERT INTO [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_HTCapabilities_ValuesTbl] ([DeviceIndex], [RadioIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[RadioIndex]) ;
   INSERT INTO [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_VHTCapabilities_ValuesTbl] ([DeviceIndex], [RadioIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[RadioIndex]) ;
   INSERT INTO [Device_WiFi_DataElements_Network_Device_Radio_BackhaulSTA_ValuesTbl] ([DeviceIndex], [RadioIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[RadioIndex]) ;
   INSERT INTO [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_ValuesTbl] ([DeviceIndex], [RadioIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[RadioIndex]) ;
END;

DROP TRIGGER IF EXISTS [tr_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_delete];
CREATE TRIGGER [tr_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl]
BEGIN 
   DELETE FROM [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [RadioIndex] = OLD.[RadioIndex] ;
   DELETE FROM [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_HTCapabilities_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [RadioIndex] = OLD.[RadioIndex] ;
   DELETE FROM [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_VHTCapabilities_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [RadioIndex] = OLD.[RadioIndex] ;
   DELETE FROM [Device_WiFi_DataElements_Network_Device_Radio_BackhaulSTA_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [RadioIndex] = OLD.[RadioIndex] ;
   DELETE FROM [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [RadioIndex] = OLD.[RadioIndex] ;
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_ValuesTbl
    SET NumberOfAccessPoints = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl WHERE 1 )
     WHERE 1;
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_ValuesTbl
    SET NumberOfAccessPoints = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_AccessPoint_ValuesTbl WHERE 1 )
     WHERE 1;
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_ValuesTbl
    SET NumberOfDevices = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_ValuesTbl WHERE 1 )
     WHERE 1;
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_ValuesTbl
    SET NumberOfDevices = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_ValuesTbl WHERE 1 )
     WHERE 1;
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_ValuesTbl
    SET NumberOfInterfaces = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_ValuesTbl
    SET NumberOfInterfaces = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl
    SET NumberOfNeighbors = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [InterfaceIndex] = NEW.[InterfaceIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [InterfaceIndex] = NEW.[InterfaceIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Interface_ValuesTbl
    SET NumberOfNeighbors = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Interface_Neighbor_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [InterfaceIndex] = OLD.[InterfaceIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [InterfaceIndex] = OLD.[InterfaceIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_ValuesTbl
    SET NumberOfRadios = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_ValuesTbl
    SET NumberOfRadios = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl
    SET NumberOfCurrOpClass = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl
    SET NumberOfCurrOpClass = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_ValuesTbl
    SET NumberOfOperatingClasses = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_ValuesTbl
    SET NumberOfOperatingClasses = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl
    SET NumberOfNonOperChan = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OperatingClassesIndex] = NEW.[OperatingClassesIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OperatingClassesIndex] = NEW.[OperatingClassesIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_ValuesTbl
    SET NumberOfNonOperChan = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_Capabilities_OperatingClasses_NonOperable_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OperatingClassesIndex] = OLD.[OperatingClassesIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OperatingClassesIndex] = OLD.[OperatingClassesIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl
    SET NumberOfBSS = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ValuesTbl
    SET NumberOfBSS = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl
    SET NumberOfSTA = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [BSSIndex] = NEW.[BSSIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [BSSIndex] = NEW.[BSSIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_BSS_ValuesTbl
    SET NumberOfSTA = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_BSS_STA_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [BSSIndex] = OLD.[BSSIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [BSSIndex] = OLD.[BSSIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_ValuesTbl
    SET NumberOfOpClassScans = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_ValuesTbl
    SET NumberOfOpClassScans = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
    SET NumberOfChannelScans = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
    SET NumberOfChannelScans = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_insert] AFTER INSERT ON [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
    SET NumberOfNeighbors = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex] AND [ChannelScanIndex] = NEW.[ChannelScanIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex] AND [ChannelScanIndex] = NEW.[ChannelScanIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_delete] AFTER DELETE ON [Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl]
BEGIN 
    UPDATE Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
    SET NumberOfNeighbors = ( SELECT COUNT(RowId) FROM Device_WiFi_DataElements_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex] AND [ChannelScanIndex] = OLD.[ChannelScanIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex] AND [ChannelScanIndex] = OLD.[ChannelScanIndex];
END;


