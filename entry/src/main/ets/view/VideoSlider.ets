@Component
export struct VideoSlider{

  @Consume isPlay:boolean;
  @Consume currentTime:number;
  @Consume durationTime:number;
  @Consume durationStringTime:string;
  @Consume currentTimeString:string;
  private controller:VideoController;
  @Consume isSlider:boolean;



  build(){
    Row(){
      Image(this.isPlay?$r('app.media.ic_ok'):$r('app.media.icon')).width(20).onClick(()=>{
        if(this.isPlay){
          this.controller.pause()
        }else{
          this.controller.start();
        }
        this.isPlay=!this.isPlay;
      })
      Text(this.currentTimeString).fontSize(16).fontColor(Color.White)
      Slider({value:this.currentTime,min:0,max:this.durationTime,step:1,style:SliderStyle.OutSet}).width('60%').onChange((value)=>{
        console.log("jasper "+value);
        this.currentTime = parseInt(value.toString());
        this.controller.setCurrentTime(this.currentTime,SeekMode.Accurate)
      })
      Text(this.durationStringTime).fontSize(16).fontColor(Color.White)
    }.alignItems(VerticalAlign.Center).justifyContent(FlexAlign.SpaceEvenly).width('100%')
  }
}