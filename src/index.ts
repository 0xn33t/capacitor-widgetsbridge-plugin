import { registerPlugin } from '@capacitor/core';

import type { WidgetsBridgePluginPlugin } from './definitions';

const WidgetsBridgePlugin = registerPlugin<WidgetsBridgePluginPlugin>(
  'WidgetsBridgePlugin',
  {
    web: () => import('./web').then(m => new m.WidgetsBridgePluginWeb()),
  },
);

export * from './definitions';
export { WidgetsBridgePlugin };
