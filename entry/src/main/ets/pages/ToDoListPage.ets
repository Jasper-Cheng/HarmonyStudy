import DataModel from '../viewmodel/DataModel';
import ToDoItem from '../view/ToDoItem';
import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import EntryAbility from '../entryability/EntryAbility';


@Entry
@Component
struct ToDoListPage{

  // private context = getContext(this) as common.UIAbilityContext;
  //
  // handleStartAbilityTest() {
  //   //1.2 指定要跳转到的UIAbility的信息
  //   let want:Want = {
  //     deviceId: '', // deviceId为空表示本设备
  //     bundleName: 'com.example.myapplication',
  //     abilityName: 'EntryAbility2',//ability的名称  去项目module.json5文件里的module.abilities.name
  //     moduleName: 'entry', // 模块名 去项目module.json5文件里的module.name
  //     parameters: { //参数
  //       instanceKey: "key",//UIAbility实例的key
  //       src:"ToDoListPage 页面向你问好"
  //     },
  //   }
  //   //1.3 尝试拉起目标UIAbility实例
  //   this.context.startAbility(want);
  // }



  private totalTasks:string[];
  @State message:string = "";


  aboutToAppear(){
    this.totalTasks=DataModel.getData();
  }

  build() {
    Column() {
      Text($r('app.string.page_title'))
      ForEach(this.totalTasks,(item:string)=>{
        ToDoItem({content:item})
      },(item:string)=>JSON.stringify(item))
      Text("Test2 测试").onClick(()=>{
        // this.handleStartAbilityTest()
        router.pushUrl({
          url:'pages/Index',
          params:{
            src:"ToDoListPage 页面向你问好"
          }
        })
      })
      Text(this.message)
    }.alignItems(HorizontalAlign.Start)
  }

  onPageShow(){
    this.message=router.getParams()?.['src'];
  }
}