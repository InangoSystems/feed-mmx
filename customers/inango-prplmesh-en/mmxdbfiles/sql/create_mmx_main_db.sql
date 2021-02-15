-- ***********************************************************
-- Information table for object Device.Controller.Network.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_ValuesTbl; 
CREATE TABLE Device_Controller_Network_ValuesTbl
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
-- Information table for object Device.Controller.Network.AccessPoint.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_AccessPoint_ValuesTbl; 
CREATE TABLE Device_Controller_Network_AccessPoint_ValuesTbl
(
    [AccessPointIndex]     INTEGER,
    [SSID]    TEXT DEFAULT "0",
    [MultiApMode]    TEXT DEFAULT "Fronthaul",
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
-- Information table for object Device.Controller.Network.AccessPoint.{i}.Security.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_AccessPoint_Security_ValuesTbl; 
CREATE TABLE Device_Controller_Network_AccessPoint_Security_ValuesTbl
(
    [AccessPointIndex]     INTEGER,
    [ModeEnabled]    TEXT DEFAULT "None",
    [PreSharedKey]    TEXT,
    [KeyPassphrase]    TEXT,
    [SAEPassphrase]    TEXT,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([AccessPointIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [ID]    TEXT DEFAULT "00:00:00:00:00:00",
    [CollectionInterval]    INTEGER DEFAULT 0,
    [NumberOfRadios]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.MultiAPCapabilities.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_MultiAPCapabilities_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_MultiAPCapabilities_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [USTALinkMatricCurrentlyOn]    INTEGER DEFAULT 0,
    [USTALinkMatricCurrentlyOff]    INTEGER DEFAULT 0,
    [AgentInitiatedRCPIBasedSteering]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ValuesTbl
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
    [NumberOfUnassocSTA]    INTEGER DEFAULT 0,
    [NumberOfOpClassScan]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.CurrentOperatingClasses.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl
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
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_Capabilities_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_Capabilities_ValuesTbl
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
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OperatingClassIndex]     INTEGER,
    [Class]    INTEGER DEFAULT 0,
    [MaxTxPower]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OperatingClassIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.NonOperable.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OperatingClassIndex]     INTEGER,
    [NonOpChannelNumber]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OperatingClassIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_BSS_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_BSS_ValuesTbl
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
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.STA.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl
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
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.BackhaulSTA.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_BackhaulSTA_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_BackhaulSTA_ValuesTbl
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
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [NumberOfOpClassScan]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
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
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OpClassScanIndex]     INTEGER,
    [ChannelScanIndex]     INTEGER,
    [Channel]    INTEGER DEFAULT 0,
    [TimeStamp]    TEXT DEFAULT "0",
    [Utilization]    INTEGER DEFAULT 0,
    [Noise]    INTEGER DEFAULT 0,
    [NumberOfNeighborBSS]    INTEGER DEFAULT 0,
    [ObjInstSelfRef]    TEXT,
    [CfgOwner]    INTEGER DEFAULT 0,
    [CreateOwner]   INTEGER DEFAULT 0,
    CONSTRAINT [constr_index_columns] UNIQUE ([DeviceIndex],[RadioIndex],[OpClassScanIndex],[ChannelScanIndex])
);


-- ***********************************************************
-- Information table for object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.
-- ***********************************************************
DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl
(
    [DeviceIndex]     INTEGER,
    [RadioIndex]     INTEGER,
    [OpClassScanIndex]     INTEGER,
    [ChannelScanIndex]     INTEGER,
    [NeighborBSSIndex]     INTEGER,
    [BSSID]    INTEGER DEFAULT 0,
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
-- Triggers for table Device_Controller_Network_AccessPoint_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_AccessPoint_ValuesTbl_insert];
CREATE TRIGGER [tr_Device_Controller_Network_AccessPoint_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_AccessPoint_ValuesTbl]
BEGIN 
   INSERT INTO [Device_Controller_Network_AccessPoint_Security_ValuesTbl] ([AccessPointIndex]) 
       VALUES (NEW.[AccessPointIndex]) ;
END;

DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_AccessPoint_ValuesTbl_delete];
CREATE TRIGGER [tr_Device_Controller_Network_AccessPoint_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_AccessPoint_ValuesTbl]
BEGIN 
   DELETE FROM [Device_Controller_Network_AccessPoint_Security_ValuesTbl] 
       WHERE  [AccessPointIndex] = OLD.[AccessPointIndex] ;
END;


-- *********************************************************** 
-- Triggers for table Device_Controller_Network_Device_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_Device_ValuesTbl_insert];
CREATE TRIGGER [tr_Device_Controller_Network_Device_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_ValuesTbl]
BEGIN 
   INSERT INTO [Device_Controller_Network_Device_MultiAPCapabilities_ValuesTbl] ([DeviceIndex]) 
       VALUES (NEW.[DeviceIndex]) ;
END;

DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_Device_ValuesTbl_delete];
CREATE TRIGGER [tr_Device_Controller_Network_Device_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_ValuesTbl]
BEGIN 
   DELETE FROM [Device_Controller_Network_Device_MultiAPCapabilities_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex] ;
END;


-- *********************************************************** 
-- Triggers for table Device_Controller_Network_Device_Radio_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_Device_Radio_ValuesTbl_insert];
CREATE TRIGGER [tr_Device_Controller_Network_Device_Radio_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_ValuesTbl]
BEGIN 
   INSERT INTO [Device_Controller_Network_Device_Radio_Capabilities_ValuesTbl] ([DeviceIndex], [RadioIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[RadioIndex]) ;
END;

DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_Device_Radio_ValuesTbl_delete];
CREATE TRIGGER [tr_Device_Controller_Network_Device_Radio_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_ValuesTbl]
BEGIN 
   DELETE FROM [Device_Controller_Network_Device_Radio_Capabilities_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [RadioIndex] = OLD.[RadioIndex] ;
END;


-- *********************************************************** 
-- Triggers for table Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_insert];
CREATE TRIGGER [tr_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl]
BEGIN 
   INSERT INTO [Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_ValuesTbl] ([DeviceIndex], [RadioIndex], [OperatingClassIndex]) 
       VALUES (NEW.[DeviceIndex], NEW.[RadioIndex], NEW.[OperatingClassIndex]) ;
END;

DROP TRIGGER IF EXISTS [tr_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_delete];
CREATE TRIGGER [tr_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl]
BEGIN 
   DELETE FROM [Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_ValuesTbl] 
       WHERE  [DeviceIndex] = OLD.[DeviceIndex]  AND  [RadioIndex] = OLD.[RadioIndex]  AND  [OperatingClassIndex] = OLD.[OperatingClassIndex] ;
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_AccessPoint_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_AccessPoint_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_AccessPoint_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_AccessPoint_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_ValuesTbl
    SET NumberOfAccessPoints = ( SELECT COUNT(RowId) FROM Device_Controller_Network_AccessPoint_ValuesTbl WHERE 1 )
     WHERE 1;
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_AccessPoint_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_AccessPoint_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_AccessPoint_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_ValuesTbl
    SET NumberOfAccessPoints = ( SELECT COUNT(RowId) FROM Device_Controller_Network_AccessPoint_ValuesTbl WHERE 1 )
     WHERE 1;
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_ValuesTbl
    SET NumberOfDevices = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_ValuesTbl WHERE 1 )
     WHERE 1;
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_ValuesTbl
    SET NumberOfDevices = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_ValuesTbl WHERE 1 )
     WHERE 1;
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_ValuesTbl
    SET NumberOfRadios = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_ValuesTbl
    SET NumberOfRadios = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ValuesTbl
    SET NumberOfCurrOpClass = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ValuesTbl
    SET NumberOfCurrOpClass = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_Capabilities_ValuesTbl
    SET NumberOfOperatingClasses = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_Capabilities_ValuesTbl
    SET NumberOfOperatingClasses = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_BSS_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_BSS_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_BSS_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_BSS_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ValuesTbl
    SET NumberOfBSS = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_BSS_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_BSS_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_BSS_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_BSS_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ValuesTbl
    SET NumberOfBSS = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_BSS_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_BSS_ValuesTbl
    SET NumberOfSTA = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [BSSIndex] = NEW.[BSSIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [BSSIndex] = NEW.[BSSIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_BSS_ValuesTbl
    SET NumberOfSTA = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [BSSIndex] = OLD.[BSSIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [BSSIndex] = OLD.[BSSIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ScanResult_ValuesTbl
    SET NumberOfOpClassScan = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ScanResult_ValuesTbl
    SET NumberOfOpClassScan = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
    SET NumberOfChannelScans = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl
    SET NumberOfChannelScans = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex];
END;


-- *********************************************************** 
-- "Counter" triggers for table Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl
-- *********************************************************** 
DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_insert];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_insert] AFTER INSERT ON [Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
    SET NumberOfNeighborBSS = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex] AND [ChannelScanIndex] = NEW.[ChannelScanIndex] )
     WHERE 1 AND [DeviceIndex] = NEW.[DeviceIndex] AND [RadioIndex] = NEW.[RadioIndex] AND [OpClassScanIndex] = NEW.[OpClassScanIndex] AND [ChannelScanIndex] = NEW.[ChannelScanIndex];
END;

DROP TRIGGER IF EXISTS [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_delete];
CREATE TRIGGER [tr_cnt_Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl_delete] AFTER DELETE ON [Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl]
BEGIN 
    UPDATE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl
    SET NumberOfNeighborBSS = ( SELECT COUNT(RowId) FROM Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex] AND [ChannelScanIndex] = OLD.[ChannelScanIndex] )
     WHERE 1 AND [DeviceIndex] = OLD.[DeviceIndex] AND [RadioIndex] = OLD.[RadioIndex] AND [OpClassScanIndex] = OLD.[OpClassScanIndex] AND [ChannelScanIndex] = OLD.[ChannelScanIndex];
END;


