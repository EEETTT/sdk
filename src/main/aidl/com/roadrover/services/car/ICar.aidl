// ICar.aidl
package com.roadrover.services.car;
import com.roadrover.services.car.ICarCallback;
import com.roadrover.services.car.IMcuUpgradeCallback;

interface ICar {
    /**
     * 获取协议卡MCU的软件版本
     */
    String getProtocolMcuVersion();

    /**
     * 获取车型ID
     */
    int getCarId();

    /**
     * 注册回调
     * @param callback 回调接口
     */
	void registerCallback(ICarCallback callback);

	/**
	 * 注销回调
	 * @param callback 回调接口
	 */
	void unRegisterCallback(ICarCallback callback);

    /**
     * 注册高频实时车辆信息ID，只有注册后才能获取该ID的实时回调
     * @param id IVICar.RealTimeInfoId
     * @param callback 被调用的回调接口
     */
	void registerRealTimeInfo(int id, ICarCallback callback);

    /**
     * 注销高频实时车辆信息ID，不再接收该ID的回调
     * @param id IVICar.RealTimeInfoId
     * @param callback 实时信息id更新后不再被调用的回调接口
     */
	void unRegisterRealTimeInfo(int id, ICarCallback callback);

    /**
     * 获取实时车辆信息
     * @param id IVICar.RealTimeInfoId
     */
    float getRealTimeInfo(int id);

    /**
     * 获取CCD状态，返回IVICar.CcdStatus
     */
	int getCcdStatus();

    /**
     * 获取手刹状态，返回IVICar.HandbrakeStatus
     */
	int getHandbrakeStatus();

	/**
	 * 获取车门状态mask
	 */
	int getDoorStatusMask();

	/**
	 * 获取车灯状态mask
	 */
	int getLightStatusMask();

	/**
     * 获取大灯状态mask
     */
    boolean getHeadLightStatus();

	/**
	 * 获取空调原始值，有的需要通过IVICar.Climate来解析
	 * @param id Climate.Id
	 */
	int getClimate(int id);

    /**
     * 设置空调值
     * @param id Climate.Id
     * @param value 空调值
     */
	void setClimate(int id, int value);

    /**
     * 获取原车设置值，原始字节串
     */
	byte[] getCarSettingBytes();

    /**
     * 设置原车设置值
     * @param id 参数ID
     * @param value 设置值
     */
	void setCarSetting(int id, int value);

	/**
     * 获取雷达距离值
     */
	byte[] getRadarDistanceBytes();

	/**
     * 获取雷达报警值
     */
	byte[] getRadarWarmingBytes();

	/**
     * 通知mcu发送雷达数据
     */
	void needRadarValue();

	/**
     * 获取车外温度，需要通过IVICar.OutsideTemp来解析
     */
    int getOutsideTempRawValue();

    /**
     * 获取里程信息
     * @param id Trip.Id
     * @param index Trip.Index
     */
    float getTrip(int id, int index);

    /**
     * 获取额外车辆信息
     * @param id IVICar.ExtraState.Id
     */
    float getExtraState(int id);

    /**
     * 升级mcu
     * @param filePath 升级mcu文件
     * @param callback 回调通知
     */
    void upgradeMcu(String filePath, IMcuUpgradeCallback callback);

    /**
     * 设置倒车摄像头的电源
     * @param on true打开电源，false关闭电源
     */
    void setCcdPower(boolean on);

    /**
     * 退出操作系统启动过程中提供的快速倒车功能
     */
    void disableFastReverse();

    /**
     * 系统是否处于快速倒车状态
     */
    boolean isInFastReverse();

    /**
     * 设置外设参数
     * @param carId IVICar.ExtraDevice.CarId
     * @param deviceId IVICar.ExtraDevice.DeviceId
     * @param extraDeviceData 外设参数输入数据
     */
    void setExtraDevice(int carId, int deviceId, in byte[] extraDeviceData);

     /**
      * 设置氛围灯音频参数
      * @param extraAudioData 氛围灯音频参数数据
      */
     void setExtraAudioParameters(in byte[] extraAudioData);

    /**
     * 请求发送所有service端缓存的外设参数，通过ICarCallback回调获取
     */
    void requestExtraDeviceEvent();

    /**
     * 设置CMD_PARAM参数
     * @param id IVICar.CmdParam.Id
     * @param paramData 参数数据
     */
    void setCmdParam(int id, in byte[] paramData);

    /**
     * 获取CMD_PARAM参数
     * @param id IVICar.CmdParam.Id
     */
    byte[] getCmdParams(int id);

    /**
     * 请求发送所有service端缓存的CMD_PARAM参数，通过ICarCallback回调获取
     */
    void requestCmdParamEvent();

    /**
     * 发送触摸消息给单片机
     * X: 0 -> Left, 255 -> Right
     * Y: 0 -> Top, 255 -> Bottom
     */
    void sendTouchClick(int x, int y);

    /**
     * 获取保养里程（保养周期或保养检查）
     * @param id IVICar.Maintenance.Id
     */
    int getMaintenanceMileage(int id);

    /**
     * 获取保养天数（保养周期或保养检查）
     * @param id IVICar.Maintenance.Id
     */
    int getMaintenanceDays(int id);

    /**
     * 获取车辆识别码VIN
     */
    String getCarVIN();

    /**
     * 获取匹配钥匙数目
     */
    int getPairKeyNumber();

    /**
     * 获取故障码数组
     * @param carId IVICar.CarReport.Car
     * @param reportType IVICar.CarReport.Type
     */
    int[] getReportArray(int carId, int reportType);

    /**
     * 获取自动泊车数据
     */
    int getAutoPark();
    
    /**
     * 获取能量流动数据
     */
    byte[] getEnergyFlowData();

    /**
     * 下发原车LedKey值
     * @param key 按键值
     * @param pushType 按键种类，长短按等
     */
    void setCarLedKey(int key, int pushType);

    /**
     * 下发ADKey值
     * @param channel 通道
     * @param key 值
     */
    void setADKey(int channel, int key);

    /**
     * 发送命令给仪表
     * @param params 数据
     */
    void setClusterParam(in byte[] params);

    /**
     * 发送触摸坐标给单片机
     * @param x  x轴坐标
     * @param y  y轴坐标
     * @param type 见{@link com.roadrover.sdk.car.IVICar.TouchClickEvent}
     */
    void setTouch(in int x, in int y, in int type);

    /**
     * 发送暂停心跳命令给下位机
     */
    void pauseHeartbeat();

    /**
     * 半小时模式下，发数据给下位机开屏
     */
    void setAccOffUintOn();

    /**
     * 请求发送所有service端缓存的CMD_TPMS参数，通过ICarCallback回调获取
     */
    void requestCmdTpmsEvent();

     /**
      * 获取ACC状态，返回IVICar.Acc
      */
    boolean isAccOn();

     /**
      * 获取硬件版本等信息； 组成规则：由#分开如：{硬件版本号}#{PCB版本}#{ECN/DCN编码}#{日期}
      */
    String getHardwareVersionString();

    /**
     * 给MCU发送按键
     */
    void sendKeyToMcu(in int key);

    /**
     * 清空空调缓存值
     * @param id Climate.Id
     */
    void clearClimate(int id, int value);
}
