@Entry
@Component
export struct SetterPage{

  private arr:number[] = [0,1,2,3,4,5,6,7,8,9];


  build(){
    Scroll(){
      Column(){
        Row(){
          Text("我的").margin({bottom:30}).fontSize(26).fontWeight(600)
        }.justifyContent(FlexAlign.Start).width('100%')
        Row(){
          Image($r('app.media.top')).width(50).height(50).borderRadius(30)
          Column(){
            Text("李先生")
            Text("1300921u03u190@.1283u")
          }
          .alignItems(HorizontalAlign.Start)
          .margin({left:16})
        }
        .borderRadius(20).backgroundColor(Color.White)
        .padding(20)
        .width('100%')
        List({space:10}){
          ForEach(this.arr,(item:number)=>{
            ListItem(){
              Row(){
                Row(){
                  Image($r('app.media.top')).width(26).height(26).borderRadius(10)
                  Text(item.toString()).fontSize(22).fontWeight(500).margin({left:16})
                }.borderColor(Color.White)
                .borderWidth(1)
                Row(){
                  if(item==0){
                    Toggle({type:ToggleType.Switch,isOn:false})
                  }else{
                    Image($r('app.media.ic_ok')).width(20).height(20)
                  }
                }.borderColor(Color.White)
                .borderWidth(1)
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              .height(60)
            }
            .height(48)
          },(item)=>JSON.stringify(item))
        }
        .divider({
          strokeWidth: 1,
          color: Color.Grey,
          startMargin: 1,
          endMargin: 1
        })
        .width('100%')
        .height('50%')
        .margin({top:20,bottom:20})
        .padding({left:8,right:8})
        .backgroundColor(Color.White)
        .borderRadius(16)


        Blank()

        Button("登录",{type: ButtonType.Capsule}).width(260)
      }
      .alignItems(HorizontalAlign.Center)
      .padding(20)
      .width('100%')
      .height('100%')
    }
    .backgroundColor(Color.Green)

  }

}