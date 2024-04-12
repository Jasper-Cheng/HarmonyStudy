import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = router.getParams()?.['src'];

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            router.back({
              url:"pages/ToDoListPage",
              params:{
                src:"Index 向你问好"
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  // onPageShow(){
  //   this.message=(router.getParams() as routerParams).src
  // }
}

class routerParams {
  src:string
  constructor(str:string) {
    this.src = str
  }
}