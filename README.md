# Xcode

ComaiotUI 说明
============

### 导入 ComaiotUI

使用pod path 导入 ComaiotUI.podspec

```ruby
pod 'ComaiotUI', :path => '../ComaiotUI'
```
>  关于 [CocoaMQTT](http://www.emqtt.com/clients#Objective-C)  [github](https://github.com/emqtt/CocoaMQTT)
> 
> CocoaMQTT的1.1.3版本，官方未提供支持OC 请自己手动 或 使用pod （` pod 'ComaiotUI/CocoaMQTT', :path => '../ComaiotUI'`）, CocoaMQTTSource目录下 有修改后的源文件
>
>声网 AgoraRtcEngine_iOS 可以自己导入或者 `pod 'ComaiotUI/AgoraRtcEngine_iOS'`


### 关于ComaiotSDK 

> App和设备通信使用mqtt服务，App对设备属于单向通信,设备对App属于单向通信.
>
>设备接收到App发送的命令 会以同样的命令 回复App 但是在逻辑上不属于同一条消息

1. App to 设备：

    * 查询在线状态 `CSMessageStatusCMD`
 
    * 查询设备设置 `CSMessageConfigGetCMD`

    * 修改设备设置 `CSMessageConfigSetCMD`

    * 重启设备 `CSMessageResetCMD`

    * 升级设备 `CSMessageUpgradeCMD`

    * 操作设备  `CSMessageControlCMD` 控制类型  control_type   0/1/2/3      拍照/录像/关闭紧急通话/上传日志

    * 远程视频 `CSMessageGetVideoCMD`

    * 取消设备分享 `CSMessageRemoveShareCMD`

```objective-c
CSMessage *msg = [CSMessage setConfig];
//msg.cmd =CSMessageConfigSetCMD
msg.content[@"deviceNickName"] = name;
[[CSApiManager shareInstance] sendMsg:msg toDevice:self.showDevice];

CSMessage *msg = [CSMessage controlDev];
//msg.cmd = CSMessageControlCMD
msg.content[@"control_type"]= @"3";
[[CSApiManager shareInstance] sendMsg:msg toDevice:self.showDevice];

```

2. 设备 to App：
    * 设备设置更新 `CSMessageSetChangeNotice`
    * 设备远程视频 `CSMessageRemoteVideoNotice`
    * 设备紧急电话呼叫 `CSMessageCallAlertNotice`
    * 设备开启省电模式 `CSMessageSavingModeNotice`
    * 设备进入声网 `CSMessageJoinAgoraNotice`
    * 设备挂断 `CSMessageCloseRemoteNotice`
    * 分享设备被取消 `CSMessageShareRemoveNotice`
    
3. CSDeviceUpdateNotifacation 设备被删除和获取设备列表通知

4. CSDeviceNoticeNotifacation 接收到设备的Notice消息通知 

### Comaiot 流程

1. 使用`jwt` 登录控慧后台后 进入设备界面`CUIDeviceController`

2. 获取设备列表 ，接收设备更新通知`CSDeviceUpdateNotifacation` 

```objective-c
[[CSApiManager shareInstance] getDeviceList:^(NSArray<CSDevice *> *devices, NSError *error) {

}];
```

3. 收到设备跟新通知后 `CSMsgCenterDidAddDeviceNotification`

4. 设备添加完成即可和设备通信，设备不在线的情况下 发送消息 不会有回复

``` objective-c
//查询设备在线 
[dev updateStatusFromDev]; 
/*
等同于
CSMessage *msg = [CSMessage queryStatus];
[[CSApiManager shareInstance] sendMsg:msg toDevice:dev];
*/
//查询设备配置
[dev updateConfigFromDev];
/*
等同于
CSMessage *msg = [CSMessage queryConfig];
[[CSApiManager shareInstance] sendMsg:msg toDevice:dev];
*/

```
 
4. 设备添加流程 具体使用请查看CSApiManager 设备绑定相关的Api

    1. 获取添加AID
    2. 获取绑定二维码字段，生成二维码，然后使用设备扫描二维码
    3. 查询设备是否绑定成功
    
5. 配网
    
    1. 获取配网 code
    2. App连接设备广播的WIFI中 
    3. 发送 code 给设备



