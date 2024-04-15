import StateManagerData, { StateManagerItem } from '../viewmodel/StateManagerData';
import AddTargetDialog from '../view/AddTargetDialog';
import Prompt from '@system.prompt';
import TargetInfo from '../view/TargetInfo';
import TaskListItem from '../view/TaskListItem';
@Entry
@Component
struct StateManager {

  @State latestUpdateDate:string='-';
  @State totalTasksNumber: number = 0;
  @State completedTasksNumber: number = 0;
  @State isModified:boolean = false;
  @State isAllSelect:boolean = false;
  @State selectArray:Array<boolean> = [];
  @Provide @Watch('onProgressChanged') overAllProgressChanged:Boolean = false;
  @State targetData:Array<StateManagerItem> = StateManagerData.getData();
  dialogController:CustomDialogController=new CustomDialogController({
    alignment:DialogAlignment.Bottom,
    offset:{
      dx:0,
      dy:'-20vp'
    },
    customStyle:true,
    autoCancel:false,
    builder:AddTargetDialog({
      onClickOk:(value:string)=>{
        this.saveTask(value);
      }
    }),
  });

  onProgressChanged(){
    this.completedTasksNumber=this.targetData.filter((item:StateManagerItem)=>{
      return item.taskProgress==100;
    }).length;
    this.totalTasksNumber=this.targetData.length;
    this.latestUpdateDate=new Date().toLocaleString();
  }


  aboutToAppear(){
    StateManagerData.addData(new StateManagerItem("子任务一",0,"2024/3//12 12:00:00"));
    StateManagerData.addData(new StateManagerItem("子任务二",0,"2024/3//13 12:00:00"));
    StateManagerData.addData(new StateManagerItem("子任务三",0,"2024/3//14 12:00:00"));
    this.selectAllOrCancel(false)
  }

  selectAllOrCancel(selectStatus:boolean){
    let newSelectArray: Array<boolean> = [];
    this.targetData.forEach(() => {
      newSelectArray.push(selectStatus);
    });
    this.selectArray = newSelectArray;
  }

  // isDataAllSelected():boolean{
  //   let allTrue=true;
  //   this.selectArray.forEach(element => {
  //     if(element==false){
  //       allTrue=false;
  //     };
  //   },item=>item);
  //   return allTrue;
  // }

  isDataAllUnSelected():boolean{
    let allFalse=true;
    this.selectArray.forEach(element => {
      if(element==true){
        allFalse=false;
      };
    },item=>item);
    return allFalse;
  }




  build() {
    Column() {
      Text("工作目标").fontSize(24).fontWeight(800).margin({left:10,right:10,bottom:10})

      TargetInfo({
        latestUpdateDate:this.latestUpdateDate,
        completedTaskNumber:this.completedTasksNumber,
        totalTaskNumber:this.totalTasksNumber
      })

      Column(){
        Row(){
          Text("子目标").fontSize(16).fontWeight(800).margin({left:10,right:10})
          if(this.isModified){
            Row(){
              Text("取消").fontSize(14).fontWeight(800).fontColor(Color.Blue).margin({left:10})
                .onClick(()=>{
                  this.isModified=false;
                })
              if(this.selectArray.length>0){
                Text("全选").fontSize(14).fontWeight(800).fontColor(Color.Blue).margin({left:10,right:4})
                  .onClick(()=>{
                    this.isAllSelect=!this.isAllSelect;
                    this.selectAllOrCancel(this.isAllSelect);
                  })
                Checkbox()
                  .select(this.isAllSelect)
                  .selectedColor('#007DFF')
                  .width(20)
                  .onClick(()=>{
                    this.isAllSelect=!this.isAllSelect;
                    this.selectAllOrCancel(this.isAllSelect);
                  })
              }
            }.justifyContent(FlexAlign.End)
          }else{
            Text("编辑").fontSize(14).fontWeight(800).fontColor(Color.Blue).margin({left:10,right:10})
              .onClick(()=>{
                this.isModified=true
              })
          }
        }
        .padding({bottom:10})
        .height(40)
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        List({space: 12}){
          ForEach(this.targetData,(item:StateManagerItem,index: number)=>{
            ListItem(){
              TaskListItem({
                item:item,
                index:index,
                taskItemProgress:item.taskProgress,
                isModified:this.isModified,
                selectArray:$selectArray,
                isAllSelect:$isAllSelect,
                onAddClick:(taskItemProgress:number,updateDate:string,index:number)=>{
                  StateManagerData.updateProgress(index,taskItemProgress,updateDate);
                  this.targetData=StateManagerData.getData();
                  this.overAllProgressChanged=!this.overAllProgressChanged;
                }
              })
            }
          })
        }
        .width('100%')
        .height(300)
      }
      .margin({top:10})

      Blank()

      Row(){
        if(this.isModified){
          Button("删除").type(ButtonType.Capsule).fontSize(12).fontWeight(800).padding({left:30,right:30}).backgroundColor(Color.Grey).fontColor(Color.Red)
            .opacity(this.isDataAllUnSelected()==true?0.5:1)
            .onClick(()=>{
              if(this.isDataAllUnSelected()){
                Prompt.showToast({
                  message:"请至少选择一项",
                  duration:1000,
                  bottom:64
                })
                return;
              }else{
                StateManagerData.deleteData(this.selectArray);
                this.targetData=StateManagerData.getData();
                this.selectAllOrCancel(false)
                this.onProgressChanged()
                if(this.selectArray.length==0)this.isAllSelect=false;
              }
            })
        }else{
          Button("添加子目标").type(ButtonType.Capsule).fontSize(12).fontWeight(800).padding({left:30,right:30}).backgroundColor(Color.Grey).fontColor(Color.Blue)
            .onClick(()=>this.dialogController.open())
        }

      }.width('100%').justifyContent(FlexAlign.Center)

    }
    .padding(10)
    .alignItems(HorizontalAlign.Start)
    .height('100%')
    .width('100%')
    .backgroundColor("#F1F2F5")
  }


  saveTask(value:string){
    if(value==''){
      Prompt.showToast({
        message:"任务名称不能为空",
        duration:3000,
        bottom:64
      })
      return;
    };
    StateManagerData.addData(new StateManagerItem(value,0,new Date().toLocaleString()));
    this.targetData=StateManagerData.getData();
    this.overAllProgressChanged=!this.overAllProgressChanged;
    this.dialogController.close();
  }


}