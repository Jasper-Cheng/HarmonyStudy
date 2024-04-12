import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    console.log("Jasper EntryAbility onCreate")
    //应用初始化,例如系统状态查询等
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    console.log("Jasper EntryAbility onDestroy")
    //应用销毁,释放系统资源、数据保存等
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log("Jasper EntryAbility onWindowStageCreate")
    //设置ui加载，设置windowStage事件订阅(焦点、可见)等
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/ToDoListPage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    console.log("Jasper EntryAbility onWindowStageDestroy")
    //释放ui资源
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    
    console.log("Jasper EntryAbility onForeground")
    //申请应用需要的资源(权限等),或者重新申请再onBackground中释放的资源
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    console.log("Jasper EntryAbility onBackground")
    //释放ui不可见时无用的资源，或者再此执行较为耗时的操作
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onNewWant(){
    console.log("Jasper EntryAbility onNewWant")
    //当ability的启动模式为Multiton时，如果已经存在相同的ability,则不在创建而是重新进入(不走onCreate、onWindowStage,而是走onNewWant)
  }

}
