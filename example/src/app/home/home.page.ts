import { Component } from '@angular/core';
import { WidgetsBridgePlugin } from 'capacitor-widgetsbridge-plugin';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  text: string = '';

  constructor() {}

  async onUpdate(){
    await WidgetsBridgePlugin.setItem({key: 'demo', value: this.text, group: 'group.com.capacitorjs.demo'});
    //await await WidgetsBridgePlugin.reloadAllTimelines();
    await WidgetsBridgePlugin.reloadTimelines({ofKind: 'DemoWidget'});
  }

  async do(option: string){
    switch (option) {
      case 'set':
        let resSet = (await WidgetsBridgePlugin.setItem({key: 'demo', value: 'test', group: 'group.com.capacitorjs.demo'}));
        console.log(resSet);
        break;
      case 'get':
        let resGet = (await WidgetsBridgePlugin.getItem({key: 'demo', group: 'group.com.capacitorjs.demo'}));
        console.log(resGet);
        break;
      case 'remove':
        let resRemove = (await WidgetsBridgePlugin.removeItem({key: 'demo', group: 'group.com.capacitorjs.demo'}));
        console.log(resRemove);
        break;
      case 'reload':
        let resReload = (await WidgetsBridgePlugin.reloadAllTimelines());
        console.log(resReload);
        break;
    }
  }

}
