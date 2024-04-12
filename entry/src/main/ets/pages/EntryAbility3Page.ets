import { HomePage } from '../view/home';
import { SetterPage } from '../view/setter';
@Entry
@Component
export struct EntryAbility3Page{
  private tabController:TabsController=new TabsController();
  @State currentIndex:number = 0 ;
  

  @Builder TabBuilder(title:string,index:number,selectedImg:Resource,normalImg:Resource){
    Column(){
      Image(this.currentIndex==index? selectedImg:normalImg)
        .width(25)
        .height(25)
      Text(title)
    }.onClick(()=>{
      this.currentIndex = index;
      this.tabController.changeIndex(this.currentIndex);
    })
  }

  build(){
    Tabs({
      barPosition:BarPosition.End,
      controller:this.tabController
    }){
      TabContent(){
        HomePage()
      }
      .backgroundColor(Color.Green)
      .tabBar(this.TabBuilder("首页",0,$r('app.media.ic_ok'),$r('app.media.ic_default')))
      TabContent(){
        SetterPage()
      }
      .backgroundColor(Color.Green)
      .tabBar(this.TabBuilder("我的",1,$r('app.media.ic_ok'),$r('app.media.ic_default')))
    }
    .backgroundColor(Color.Gray)
    .barMode(BarMode.Fixed)
    .barHeight("56vp")
    .onChange((index:number)=>{
      this.currentIndex=index;
    })

  }

}