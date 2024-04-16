import router from '@ohos.router';
@Entry
@Component
struct VideoPlayer {
  @State message: string = 'Hello World'
  private imageList:Array<Resource> = [];


  aboutToAppear(){
    this.imageList.push($r('app.media.top'))
    this.imageList.push($r('app.media.top'))
    this.imageList.push($r('app.media.top'))
    this.imageList.push($r('app.media.top'))
    this.imageList.push($r('app.media.top'))
  }

  build() {
    Column(){
      Swiper(){
        Image($r('app.media.top')).borderRadius(20)
        Image($r('app.media.top')).borderRadius(20)
        Image($r('app.media.top')).borderRadius(20)
      }.autoPlay(true).height('26%').width('100%')
      Column(){
        Text('最近播放').fontSize(20).fontWeight(600)
        List({space:10}){
          ForEach(this.imageList,(item,index)=>{
            ListItem(){
              Image(item)
            }.onClick(()=>{
              router.pushUrl({url:"pages/SimpleVideo",params:{source:item}})
            })
          })
        }.width('100%').height('20%').listDirection(Axis.Horizontal).padding(10)
      }.alignItems(HorizontalAlign.Start).margin({top:20}).borderRadius(20).backgroundColor(Color.White).padding(10)

    }.padding({left:20,right:20,top:20}).backgroundColor(Color.Grey).height('100%').width('100%')
  }
}