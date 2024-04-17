import common from '@ohos.app.ability.common'
import dataPreferences from '@ohos.data.preferences';
@Entry
@Component
struct FontChange {
  @State message: string = 'Hello World'
  @State fontSize:number = 20;

  private keyName:string="fontSize";

  private context=getContext(this) as common.UIAbilityContext;
  private preference:dataPreferences.Preferences;

  async aboutToAppear(){
    this.preference=await dataPreferences.getPreferences(this.context,this.keyName);
    this.preference.get(this.keyName,1).then((value:number)=>{
      console.log("jasper "+value)
      this.fontSize=value;
    });
  }

  build() {
    Column(){
      Text("asssd").fontSize(this.fontSize)
      Text("asssd").fontSize(this.fontSize)
      Text("asssd").fontSize(this.fontSize)
      Text("asssd").fontSize(this.fontSize)
      Text("asssd").fontSize(this.fontSize)
      Slider({value:this.fontSize,min:1,max:50,step:1,style:SliderStyle.OutSet}).width('80%').showTips(true).onChange(async (value)=>{
        this.fontSize=value;
        await this.preference.put(this.keyName,value);
        this.preference.flush()
      })
    }.width('100%').height('100%').alignItems(HorizontalAlign.Center)
  }
}