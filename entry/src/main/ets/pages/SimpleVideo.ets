import router from '@ohos.router';
import Prompt from '@system.prompt';
import window from '@ohos.window';
import { VideoSlider } from '../view/VideoSlider';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct SimpleVideo{
  @State source:Resource = $r('app.media.top');
  private controller: VideoController = new VideoController();
  @Provide isPlay:boolean = false;
  @Provide currentTime:number = 0;
  @Provide durationTime:number = 0;
  @Provide durationStringTime:string = '';
  @Provide currentTimeString:string = '00:00';
  @Provide isSlider:boolean = false;

  private context=getContext(this) as common.UIAbilityContext;


  aboutToAppear(){
    window.getLastWindow(this.context).then((windowClass)=>{
      windowClass.setWindowSystemBarEnable(["status"])
    })
    this.source=(router.getParams() as Record<string, Object>).source as Resource;
  }

  build(){
    Column(){
      Video({src:$r('app.media.test'),
        previewUri:$r('app.media.top'),
        controller: this.controller
      }).autoPlay(false).controls(false).width('100%').objectFit(ImageFit.Contain).loop(false).height('93%')
        .onUpdate((event)=>{
          if(event){
            this.currentTime=event.time;
            let second: number = this.currentTime % 60;
            let min: number = parseInt((this.currentTime / 60).toString());
            let head = min < 10 ? `${0}${min}` : min;
            let end = second < 10 ? `${0}${second}` : second;
            this.currentTimeString = `${head}:${end}`;
          }
        })
        .onPrepared((event)=>{
          this.durationTime=event.duration;
          let second: number = event.duration % 60;
          let min: number = parseInt((event.duration / 60).toString());
          let head = min < 10 ? `${0}${min}` : min;
          let end = second < 10 ? `${0}${second}` : second;
          this.durationStringTime = `${head}:${end}`;
        })
        .onFinish(()=>{

        })
        .onError(()=>{
          Prompt.showToast({message:'视频播放错误',duration:1000})
        })
      VideoSlider({controller:this.controller}).backgroundColor(Color.Black).height('18%')
    }
  }
}