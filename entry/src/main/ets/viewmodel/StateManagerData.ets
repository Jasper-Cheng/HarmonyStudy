export class StateManagerData{
  private targetData: Array<StateManagerItem> = [];

  getData():Array<StateManagerItem>{
    return this.targetData;
  }

  addData(data: StateManagerItem) {
    if (!data) {
      console.log('addData error because data is: ' + data)
      return;
    }
    this.targetData.push(data);
  }

  deleteData(selectArr: Array<boolean>) {
    if (!selectArr) {
      console.log('Failed to delete data because selectArr is ' + selectArr)
    }
    let dataLen = this.targetData.length - 1;
    for (let i = dataLen; i >= 0; i--) {
      if (selectArr[i]) {
        this.targetData.splice(i, 1);
      }
    }
  }

  updateProgress(index: number, updateValue: number, updateDate: string): boolean {
    if (!this.targetData[index]) {
      return false;
    }
    this.targetData[index].taskProgress = updateValue;
    this.targetData[index].updateDate = updateDate;
    return true;
  }


}

export default new StateManagerData();

export class StateManagerItem{
  taskName:string;
  taskProgress:number;
  updateDate:string

  constructor(taskName: string, taskProgress: number, updateDate: string) {
    this.taskName = taskName;
    this.taskProgress = taskProgress;
    this.updateDate = updateDate;
  }
  

}

