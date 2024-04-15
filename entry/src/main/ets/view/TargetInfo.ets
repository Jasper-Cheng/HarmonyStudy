@Component
export default struct TargetInfo{

  @Prop totalTaskNumber:number;
  @Prop completedTaskNumber:number;
  @Prop latestUpdateDate:string;

  build(){
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
          Text("更新时间:"+this.latestUpdateDate).fontWeight(800).fontSize(12).fontColor(Color.Grey)
        }
        .alignItems(HorizontalAlign.Start)
        Stack(){
          Text(this.completedTaskNumber+"/"+this.totalTaskNumber).fontWeight(800).fontSize(12)
          Progress({value:this.completedTaskNumber,total:this.totalTaskNumber,type:ProgressType.Ring}).width(40).height(40).color(Color.Blue).style({
            strokeWidth: 4.8
          })
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
  }
}