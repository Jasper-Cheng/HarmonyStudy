import StateManagerData, { StateManagerItem } from '../viewmodel/StateManagerData';
@Component
export default struct TaskListItem{
  item:StateManagerItem;
  index: number;
  @State taskItemProgress:number=0;
  @Prop isModified:boolean;
  @Link selectArray:Array<boolean>;
  @Link isAllSelect:boolean;
  @State expanded:boolean=false;
  // @Consume overAllProgressChanged: boolean;
  onAddClick?: (taskItemProgress:number,updateDate:string,index:number) => void;

  isDataAllSelected():boolean{
    let allTrue=true;
    this.selectArray.forEach(element => {
      if(element==false){
        allTrue=false;
      };
    },item=>item);
    return allTrue;
  }

  isDataAllUnSelected():boolean{
    if(this.selectArray.length==0)return true;
    let allFalse=true;
    this.selectArray.forEach(element => {
      if(element==true){
        allFalse=false;
      };
    },item=>item);
    return allFalse;
  }

  build(){
    Column(){
      Row(){
        Text(this.item.taskName).fontWeight(800).fontSize(14)
        Row(){
          Column(){
            Text(this.item.taskProgress+"%").fontWeight(800).fontSize(14)
            Text("更新时间： "+this.item.updateDate).fontWeight(800).fontSize(10).fontColor(Color.Grey)
          }
          .alignItems(HorizontalAlign.End)
          if(this.isModified){
            Checkbox().select(this.selectArray[this.index]).selectedColor('#007DFF')
              .width(20).onClick(()=>{
              this.selectArray[this.index]=!this.selectArray[this.index];
              if(this.isDataAllSelected())this.isAllSelect=true;
              if(this.isDataAllUnSelected())this.isAllSelect=false;
            }).margin({left:10})
          }
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(()=>{
        this.expanded=!this.expanded
      })
      if(this.expanded){
        Column(){
          Row(){
            Slider({value:this.taskItemProgress,min:0,max:100,style:SliderStyle.InSet,step:1}).width('90%')
              .onChange((value:number,mode:SliderChangeMode)=>{
                this.taskItemProgress=Math.floor(value);
              })
            Text(this.taskItemProgress+"%").fontWeight(800).fontSize(12).width('20%').margin({left:10})
          }.padding({left:20,right:20}).margin({top:10,bottom:6})
          Row(){
            Text('取消').fontColor(Color.Blue).onClick(()=>{
              this.expanded=!this.expanded
              this.taskItemProgress=this.item.taskProgress;
            });
            Text('确认').fontColor(Color.Blue).onClick(()=>{
              this.onAddClick(this.taskItemProgress,new Date().toLocaleString(),this.index);
            })
          }.justifyContent(FlexAlign.SpaceEvenly).width('100%')
        }
      }
    }
    .padding({left:10,right:10,top:16,bottom:16})
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}