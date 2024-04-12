import data from '@ohos.telephony.data';
import systemDateTime from '@ohos.systemDateTime';
import StateManagerData, { StateManagerItem } from '../viewmodel/StateManagerData';
@Entry
@Component
struct StateManager {

  @State isModified:Boolean = false;
  @State targetData:Array<StateManagerItem> = StateManagerData.getData();


  aboutToAppear(){
    StateManagerData.addData(new StateManagerItem("子任务一",0,"2024/3//12 12:00:00"));
    StateManagerData.addData(new StateManagerItem("子任务二",0,"2024/3//13 12:00:00"));
    StateManagerData.addData(new StateManagerItem("子任务三",0,"2024/3//14 12:00:00"));
  }


  build() {
    Column() {
      Text("工作目标").fontSize(24).fontWeight(800).margin({left:10,right:10,bottom:10})
      Column(){
        Row(){
          Image($r('app.media.top')).width(80).height(80).borderRadius(10)
          Column(){
            Text("第一季度运营目标").fontWeight(800).fontSize(16)
            Blank(10)
            Text("实现用户量与用户活跃度提升").fontWeight(800).fontSize(12).fontColor(Color.Grey)
          }
          .alignItems(HorizontalAlign.Start)
          .margin({left:10})
        }
        .margin({bottom:10})

        Row(){
          Column(){
            Text("整体进度").fontWeight(800).fontSize(12)
            Text("更新时间:2024/4.12 16：14").fontWeight(800).fontSize(12).fontColor(Color.Grey)
          }
          .alignItems(HorizontalAlign.Start)
          Stack(){
            Text("0/3").fontWeight(800).fontSize(12)
            Progress({value:0,total:90,type:ProgressType.Ring}).width(40).height(40)
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

      }
      .alignItems(HorizontalAlign.Start)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .width('100%')
      .padding(10)


      Column(){
        Row(){
          Text("子目标").fontSize(16).fontWeight(800).margin({left:10,right:10,bottom:10})
          Text("编辑").fontSize(14).fontWeight(800).fontColor(Color.Blue).margin({left:10,right:10,bottom:10})
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({bottom:10})

        List({space: 12}){
          ForEach(this.targetData,(item:StateManagerItem)=>{
            this.TaskItem(item)
          })
        }
        .width('100%')
        .height(300)
      }
      .margin({top:16})

      Blank()

      Row(){
        Button("添加子目标").type(ButtonType.Capsule).fontSize(12).fontWeight(800).padding({left:30,right:30}).backgroundColor(Color.Grey).fontColor(Color.Blue)
          .onClick((event)=>{
            //TODO:弹窗
          })
      }.width('100%').justifyContent(FlexAlign.Center)

    }
    .padding(10)
    .alignItems(HorizontalAlign.Start)
    .height('100%')
    .width('100%')
    .backgroundColor("#F1F2F5")
  }

  @Builder TaskItem(item:StateManagerItem){
    Row(){
      Text(item.taskName).fontWeight(800).fontSize(14)
      Column(){
        Text(item.taskProgress+"%").fontWeight(800).fontSize(14)
        Text(item.updateDate).fontWeight(800).fontSize(10).fontColor(Color.Grey)
      }
      .alignItems(HorizontalAlign.End)
    }
    .padding({left:10,right:10,top:16,bottom:16})
    .borderRadius(16)
    .backgroundColor(Color.White)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

}