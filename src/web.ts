import { WebPlugin } from '@capacitor/core';

import type { WidgetsBridgePluginPlugin } from './definitions';

export class WidgetsBridgePluginWeb
  extends WebPlugin
  implements WidgetsBridgePluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
