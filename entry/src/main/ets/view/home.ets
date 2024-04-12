@Entry
@Component
export struct HomePage{
  
  private gridData1:string[] = [];
  
  aboutToAppear(){
    this.gridData1.push("1")
    this.gridData1.push("2")
    this.gridData1.push("3")
    this.gridData1.push("4")
    this.gridData1.push("5")
    this.gridData1.push("6")
    this.gridData1.push("7")
    this.gridData1.push("8")
  }

  build(){
    Scroll(){
      Column(){
        Text("首页")
        Swiper(){
          Image($r('app.media.ic_icon')).width("80%").height(160).borderRadius(10)
          Image($r('app.media.ic_icon')).width("80%").height(160).borderRadius(10)
          Image($r('app.media.ic_icon')).width("80%").height(160).borderRadius(10)
          // ForEach(this.swiperData,(item:string)=>{
          //   Image(item).objectFit(ImageFit.Fill)
          // },item=>item)
        }
        .autoPlay(true)
        .margin({top:15})


        Grid(){
          ForEach(this.gridData1,(item:string)=>{
            GridItem() {
              Column() {
                Image($r('app.media.ic_icon'))
                  .width(30)
                  .height(30)
                Text(item)
                  .fontSize(20)
                  .margin({ top: 10 })
              }
            }
          },(item:string)=>JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .backgroundColor(Color.White)
        .borderRadius(20)
        .rowsGap(12)
        .columnsGap(12)
        .height(160)
        .padding({top:10,bottom:10})
        .margin({top:20,bottom:20})

        Text("列表")

        Grid(){
          ForEach(this.gridData1,(item:string)=>{
            GridItem() {
              Column() {
                Stack(){
                  Image($r('app.media.top')).borderRadius('12vp').objectFit(ImageFit.Fill).width('100%').height('100%')
                  Text(item)
                    .fontSize(20)
                    .margin({top:10,left:10})
                  Text(item)
                    .fontSize(20)
                    .margin({left:10,top: 30})
                }
                .alignContent(Alignment.TopStart)
              }
            }
            .height('150vp')
          },(item)=>JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap('10')
        .columnsGap('10')
        .height('320vp')
        .margin({left:6,right:6,top:10})
      }
    }

  }

}