@CustomDialog
export default struct AddTargetDialog{
  private controller?:CustomDialogController;
  @State subTaskName:string = '';
  onClickOk?:(value:string) => void;

  build(){
    Column(){
      Text("添加子目标")
        .width('100%')
        .fontSize(18)
        .fontWeight(600)
        .textAlign(TextAlign.Start)
      TextInput({
        placeholder:"请输入子目标名称",
      })
        .placeholderColor(Color.Grey)
        .placeholderFont({size:16})
        .caretColor(Color.Blue)
        .backgroundColor("#0D182431")
        .width('100%')
        .margin({top:'6%'})
        .fontSize(12)
        .onChange((value:string)=>{
          this.subTaskName=value;
        })
      Blank()
      Row(){
        Button("取消")
          .dialogButtonStyle()
          .onClick(()=>{
            this.controller.close();
          })
        Button("确认")
          .dialogButtonStyle()
          .onClick(()=>{
            if(this.onClickOk!=undefined){
              this.onClickOk(this.subTaskName)
            }
          })
      }
      .width('70%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding('24vp')
    .height(150)
    .width('90.3%')
    .borderRadius(32)
    .backgroundColor(Color.White)
  }
}

@Extend(Button) function dialogButtonStyle(){
  .fontSize(16)
  .height(32)
  .width(96)
  .backgroundColor(Color.White)
  .fontColor(Color.Blue)
}